using System.Text.Json;
namespace BookStoreOnline.Services;

public class ReadingListService(IHttpContextAccessor accessor)
{
    private ISession Session => accessor.HttpContext!.Session;
    private List<int> Read(string key)
    {
        try { return JsonSerializer.Deserialize<List<int>>(Session.GetString(key) ?? "[]") ?? []; }
        catch (JsonException) { return []; }
    }
    public List<int> Favorites => Read("moc.favorites");
    public List<int> Recent => Read("moc.recent");
    public bool Contains(int id) => Favorites.Contains(id);
    public bool Toggle(int id)
    {
        var ids = Favorites;
        var added = !ids.Remove(id);
        if (added) ids.Insert(0, id);
        Session.SetString("moc.favorites", JsonSerializer.Serialize(ids.Take(100)));
        return added;
    }
    public void Remember(int id)
    {
        var ids = Recent;
        ids.Remove(id);
        ids.Insert(0, id);
        Session.SetString("moc.recent", JsonSerializer.Serialize(ids.Take(12)));
    }
}
