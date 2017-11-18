using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace AspInANetStoreFrontEnd.Models
{
    public class CustomerMetadata
    {
        [StringLength(50)]
        [Display(Name = "First Name")]
        public string FirstName;

        [StringLength(50)]
        [Display(Name = "Last Name")]
        public string LastName;

        [StringLength(50)]
        [Display(Name = "Middle Name")]
        public string MiddleName;

        [StringLength(20)]
        [Display(Name = "Phone")]
        public string Phone;

        [StringLength(254)]
        [Display(Name = "Email")]
        public string Email;

        [StringLength(256)]
        [Display(Name = "Address")]
        public string Address;

        [Display(Name = "BitCoin Amount")]
        public float BitCoinAmount;
    }
}