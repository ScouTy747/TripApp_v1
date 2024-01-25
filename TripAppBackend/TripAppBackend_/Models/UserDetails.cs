﻿namespace TripAppBackend_.Models
{
    public class UserDetails
    {
        public string UserName { get; set; }
        public string PasswordHash { get; set; }
        public string Email { get; set; }

        public UserDetails(string userName, string passwordHash, string email)
        {
            UserName = userName;
            PasswordHash = passwordHash;
            Email = email;
        }
    }
}
