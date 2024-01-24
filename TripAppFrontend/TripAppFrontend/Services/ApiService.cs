using TripAppFrontend.ViewModels;
using System.Net.Http;

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
                // Prepare the request
                var request = new HttpRequestMessage(HttpMethod.Post, "/api/Register");
                request.Content = new FormUrlEncodedContent(new[]
                {
                    new KeyValuePair<string, string>("UserName", viewModel.UserName),
                    new KeyValuePair<string, string>("Password", viewModel.Password),
                    new KeyValuePair<string, string>("Email", viewModel.Email)
                });

                // Add the authorization header
                request.Headers.Add("Authorization", "Bearer <token>");

                // Send the request
                var response = await _httpClient.SendAsync(request);

                // Check the response
                if (response.IsSuccessStatusCode)
                {
                    // Registration successful
                    return true;
                }
                else
                {
                    // Registration failed
                    return false;
                }
            }
            catch (Exception ex)
            {
                // An error occurred
                Console.WriteLine(ex.Message);
                return false;
            }
        }
    }
}
