using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace AspInANetStoreFrontEnd.Models
{
    [MetadataType(typeof(CatalogueMetadata))]
    public partial class Catalogue
    {

    }

    [MetadataType(typeof(CustomerMetadata))]
    public partial class Customer
    {

    }

    [MetadataType(typeof(ProductMetadata))]
    public partial class Product
    {

    }
}