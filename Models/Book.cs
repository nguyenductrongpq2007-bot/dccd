namespace BookStoreOnline.Models;
public partial class Book {
 public string Language {get;set;}="Tiếng Việt";
 public string Binding {get;set;}="Bìa mềm";
 public string Dimensions {get;set;}="";
 public string Translator {get;set;}="";
 public string SourceUrl {get;set;}=""; public int Id {get;set;} public string Title {get;set;} = ""; public string Description {get;set;} = ""; public string Isbn {get;set;} = ""; public int CategoryId {get;set;} public int AuthorId {get;set;} public int PublisherId {get;set;} public decimal Price {get;set;} public decimal ListPrice {get;set;} public int Stock {get;set;} public int Pages {get;set;} public int Year {get;set;} public string ImagePath {get;set;} = ""; public string SampleText {get;set;} = ""; public bool IsActive {get;set;} = true; public DateTime CreatedAt {get;set;} = DateTime.UtcNow; public Category Category {get;set;} = null!; public Author Author {get;set;} = null!; public Publisher Publisher {get;set;} = null!; }
