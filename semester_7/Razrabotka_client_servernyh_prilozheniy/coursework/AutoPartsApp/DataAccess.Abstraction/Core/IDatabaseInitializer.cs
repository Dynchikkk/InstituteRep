namespace DataAccess.Abstractions.Core
{
    /// <summary>
    /// Defines contract for initializing or migrating a database.
    /// </summary>
    public interface IDatabaseInitializer
    {
        void Initialize();
    }
}
