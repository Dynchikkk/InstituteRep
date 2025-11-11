using DataAccess.Abstractions.Core;
using DataAccess.Abstractions.Repositories;
using DataAccess.Sqlite.Config;
using DataAccess.Sqlite.Core;
using DataAccess.Sqlite.Repositories;
using Microsoft.Data.Sqlite;
using Server.Controllers;
using Server.Core;
using Server.Services;
using System.Diagnostics;

internal class Program
{
    private static async Task Main(string[] args)
    {
        Console.OutputEncoding = System.Text.Encoding.UTF8;
        Console.WriteLine("🚀 Starting SupplierClient Server...\n");

        // --- Initialize database ---
        var factory = InitializeDatabase();

        // --- Seed demo data if debug mode ---
        if (Debugger.IsAttached ||
            (args != null && args.Contains("seed", StringComparer.OrdinalIgnoreCase)))
        {
            await SeedDemoData(factory);
        }

        // --- Initialize repositories ---
        var repositories = InitializeRepositories(factory);

        // --- Initialize services ---
        var services = InitializeServices(repositories);

        // --- Initialize controllers ---
        var controllers = InitializeControllers(services);

        // --- Configure routes ---
        var router = ConfigureRoutes(controllers);

        // --- Start HTTP server ---
        await StartServer(router);
    }

    private static IDatabaseConnectionFactory<SqliteConnection> InitializeDatabase()
    {
        Console.WriteLine("[DB] Initializing database...");

        var databaseSettings = new SqliteDatabaseSettings
        {
            ConnectionString = "Data Source=database.db"
        };

        var factory = new SqliteConnectionFactory(databaseSettings);
        var initializer = new SqliteDatabaseInitializer(databaseSettings);
        initializer.Initialize();

        Console.WriteLine("[DB] Database initialized.\n");
        return factory;
    }

    private static async Task SeedDemoData(IDatabaseConnectionFactory<SqliteConnection> factory)
    {
        var seeder = new SqliteDataSeeder(factory);

        Console.WriteLine("[Seeder] Checking if database is empty...");
        var empty = await seeder.IsEmptyAsync();
        if (empty)
        {
            Console.WriteLine("[Seeder] Database empty — seeding demo data...");
            await seeder.SeedAsync();
            Console.WriteLine("[Seeder] Demo data seeding completed.\n");
        }
        else
        {
            Console.WriteLine("[Seeder] Database already contains data — skipping seed.\n");
        }
    }

    private static Dictionary<Type, object> InitializeRepositories(IDatabaseConnectionFactory<SqliteConnection> factory)
    {
        Console.WriteLine("[Repos] Initializing repositories...");
        var repos = new Dictionary<Type, object>
        {
            [typeof(IClientRepository)] = new SqliteClientRepository(factory),
            [typeof(ISupplierRepository)] = new SqliteSupplierRepository(factory),
            [typeof(IPartRepository)] = new SqlitePartRepository(factory),
            [typeof(ICategoryRepository)] = new SqliteCategoryRepository(factory),
            [typeof(IMessageRepository)] = new SqliteMessageRepository(factory),
            [typeof(IRatingRepository)] = new SqliteRatingRepository(factory),
            [typeof(IBasketRepository)] = new SqliteBasketRepository(factory)
        };
        Console.WriteLine("[Repos] Repositories initialized.\n");
        return repos;
    }

    private static Dictionary<Type, object> InitializeServices(Dictionary<Type, object> repos)
    {
        Console.WriteLine("[Services] Initializing services...");
        var services = new Dictionary<Type, object>
        {
            [typeof(AuthService)] = new AuthService(
                (IClientRepository)repos[typeof(IClientRepository)],
                (ISupplierRepository)repos[typeof(ISupplierRepository)]),
            [typeof(MessageService)] = new MessageService(
                (IMessageRepository)repos[typeof(IMessageRepository)]),
            [typeof(RatingService)] = new RatingService(
                (IRatingRepository)repos[typeof(IRatingRepository)]),
            [typeof(PartService)] = new PartService(
                (IPartRepository)repos[typeof(IPartRepository)],
                (ICategoryRepository)repos[typeof(ICategoryRepository)]),
            [typeof(BasketService)] = new BasketService(
                (IBasketRepository)repos[typeof(IBasketRepository)],
                (IPartRepository)repos[typeof(IPartRepository)],
                (IRatingRepository)repos[typeof(IRatingRepository)]),
            [typeof(CategoryService)] = new CategoryService(
                (ICategoryRepository)repos[typeof(ICategoryRepository)])
        };
        Console.WriteLine("[Services] Services initialized.\n");
        return services;
    }

    private static Dictionary<Type, object> InitializeControllers(Dictionary<Type, object> services)
    {
        Console.WriteLine("[Controllers] Initializing controllers...");
        var controllers = new Dictionary<Type, object>
        {
            [typeof(AuthController)] = new AuthController((AuthService)services[typeof(AuthService)]),
            [typeof(MessageController)] = new MessageController((MessageService)services[typeof(MessageService)]),
            [typeof(RatingController)] = new RatingController((RatingService)services[typeof(RatingService)]),
            [typeof(PartController)] = new PartController((PartService)services[typeof(PartService)]),
            [typeof(BasketController)] = new BasketController((BasketService)services[typeof(BasketService)]),
            [typeof(CategoryController)] = new CategoryController((CategoryService)services[typeof(CategoryService)])
        };
        Console.WriteLine("[Controllers] Controllers initialized.\n");
        return controllers;
    }

    private static Router ConfigureRoutes(Dictionary<Type, object> controllers)
    {
        Console.WriteLine("[Router] Configuring routes...");
        var router = new Router();

        router.Register("POST", "/auth/login", ((AuthController)controllers[typeof(AuthController)]).Login);

        router.Register("GET", "/messages", ((MessageController)controllers[typeof(MessageController)]).GetConversation);
        router.Register("POST", "/messages/send", ((MessageController)controllers[typeof(MessageController)]).SendMessage);

        router.Register("GET", "/ratings/average", ((RatingController)controllers[typeof(RatingController)]).GetAverage);
        router.Register("GET", "/ratings/personal", ((RatingController)controllers[typeof(RatingController)]).GetPersonal);
        router.Register("POST", "/ratings/set", ((RatingController)controllers[typeof(RatingController)]).Set);

        router.Register("GET", "/parts", ((PartController)controllers[typeof(PartController)]).Get);
        router.Register("POST", "/parts/add", ((PartController)controllers[typeof(PartController)]).Add);
        router.Register("POST", "/parts/update", ((PartController)controllers[typeof(PartController)]).Update);

        router.Register("POST", "/basket/build", ((BasketController)controllers[typeof(BasketController)]).Build);
        router.Register("GET", "/basket", ((BasketController)controllers[typeof(BasketController)]).Get);

        router.Register("GET", "/categories", ((CategoryController)controllers[typeof(CategoryController)]).GetAll);
        router.Register("POST", "/categories/add", ((CategoryController)controllers[typeof(CategoryController)]).Add);

        Console.WriteLine("[Router] Routes configured.\n");
        return router;
    }

    private static async Task StartServer(Router router)
    {
        Console.WriteLine("[Server] Starting HTTP server at http://localhost:8080/ ...");
        var server = new HttpServer("http://localhost:8080/", router);
        var cts = new CancellationTokenSource();

        Console.CancelKeyPress += (s, e) =>
        {
            e.Cancel = true;
            cts.Cancel();
        };

        await server.StartAsync(cts.Token);
        Console.WriteLine("[Server] Server stopped.");
    }
}
