using DataAccess.Abstractions.Repositories;
using SharedModels;

namespace Server.Services
{
    /// <summary>
    /// Client-related business logic.
    /// </summary>
    public class ClientService
    {
        private readonly IClientRepository _clientRepo;
        private readonly IRatingRepository _ratingRepo;
        private readonly IBasketRepository _basketRepo;

        public ClientService(IClientRepository clientRepo, IRatingRepository ratingRepo, IBasketRepository basketRepo)
        {
            _clientRepo = clientRepo;
            _ratingRepo = ratingRepo;
            _basketRepo = basketRepo;
        }

        public Task<Client?> GetByIdAsync(int id) => _clientRepo.GetByIdAsync(id);

        public Task<IEnumerable<Rating>> GetRatingsByClientAsync(int clientId) => _ratingRepo.GetByClientAsync(clientId);

        public Task<IEnumerable<BasketItem>> GetBasketAsync(int clientId) => _basketRepo.GetByClientAsync(clientId);
    }
}
