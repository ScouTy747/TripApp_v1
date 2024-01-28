using TripAppFrontend.ViewModels;
using System.Net.Http;
using System.Net.Http.Json;

namespace TripAppFrontend
{
    public class ApiService
    {
        private readonly HttpClient _httpClient;

        public ApiService(string baseUrl)
        {
            _httpClient = new HttpClient();
            _httpClient.BaseAddress = new Uri(baseUrl);
        }

        public async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request)
        {
            return await _httpClient.SendAsync(request);
        }

        public async Task<bool> RegisterUserAsync(SignUpViewModel viewModel)
        {
            try
            {
                var request = new HttpRequestMessage(HttpMethod.Post, "/api/Register");
                request.Content = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>("UserName", viewModel.UserName),
                    new KeyValuePair<string, string>("Password", viewModel.Password),
                    new KeyValuePair<string, string>("Email", viewModel.Email)
                });

      
                request.Headers.Add("Authorization", "Bearer <token>");

            
                var response = await _httpClient.SendAsync(request);

            
                if (response.IsSuccessStatusCode)
                {
         
                    return true;
                }
                else
                {
                    
                    return false;
                }
            }
            catch (Exception ex)
            {
         
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        public async Task<Users> LoginUserAsync(LoginViewModel viewModel)
        {
            try
            {
                var request = new HttpRequestMessage(HttpMethod.Post, "/api/Users/login");
                request.Content = new StringContent(System.Text.Json.JsonSerializer.Serialize(viewModel), System.Text.Encoding.UTF8, "application/json");

                var response = await _httpClient.SendAsync(request);

                if (response.IsSuccessStatusCode)
                {
                    // Převést odpověď na objekt Users
                    var loggedInUser = await response.Content.ReadFromJsonAsync<Users>();
                    return loggedInUser;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }
    }
}
