# README

## API Endpoints

- ##### Login User
URL: 
`POST /user`
Body:
```json
{
  username: "Raj"
}
```
Response (if user exists):
```
status: 200
{
  code: 'Success'
}
```
Response (if user doesn't exist):
```
status: 404
{
  code: "Not Found"
}
```

- ##### Register User
URL: 
`PUT /user`
Body:
```json
{
  username: "Raj"
}
```
Response (if user exists):
```
status: 400
{
  code: 'Already exists'
}
```
Response (if user doesn't exist):
```
status: 200
{
  code: "Success",
  username: "Raj"
}
```

- ##### List Movies
URL: 
`GET /movies`
Response:
```
status: 200
{
  movies: [
    {
      name: "Inception",
      genres: [
        { name: "Sci-Fi" },
        { name: "Thriller" }
      ],
      year: "2012",
      thumbnail: "http://url.com/inception.jpg",
      main_star: "Matthew McConaughey"
    },
    {
      name: "The Dark Knight",
      genres: [
        { name: "Thriller" }
      ],
      year: "2010",
      thumbnail: "http://url.com/tdk.jpg",
      main_star: "Christain Bale",
      director: "Christopher Nolan"
    },
    ...
  ]
}
```
- ##### List Favorite Movies
URL: 
`GET /movies`
Response:
```
status: 200
{
  movies: [
    {
      name: "Inception",
      genres: [
        { name: "Sci-Fi" },
        { name: "Thriller" }
      ],
      year: "2012",
      thumbnail: "http://url.com/inception.jpg",
      main_star: "Matthew McConaughey"
    },
    {
      name: "The Dark Knight",
      genres: [
        { name: "Thriller" }
      ],
      year: "2010",
      thumbnail: "http://url.com/tdk.jpg",
      main_star: "Christain Bale",
      director: "Christopher Nolan"
    },
    ...
  ]
}
```
