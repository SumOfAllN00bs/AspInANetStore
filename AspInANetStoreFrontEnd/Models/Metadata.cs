using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace AspInANetStoreFrontEnd.Models
{
    public class CatalogueMetadata
    {
        public string Name;
        public string Description;

        [Display(Name = "Extra Cost")]
        public Nullable<double> ExtraCatalogueCost;

        [Display(Name = "Image URL")]
        public string CatagoryImage;

        [Display(Name = "Color")]
        public string CatagoryColor;
    }
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
    public class ProductMetadata
    {
        [StringLength(50)]
        [Display(Name = "Name")]
        public string ProductName;

        [Display(Name = "Cost")]
        public Nullable<double> BaseCost;

        [StringLength(50)]
        [Display(Name = "Type")]
        public string Type;

        [Display(Name = "Stocked")]
        public Nullable<int> Stocked;

        [StringLength(2048)]
        [Display(Name = "ImageUrl")]
        public string ProductImage;
    }
}