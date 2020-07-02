![Ironhack logo](https://i.imgur.com/1QgrNNw.png)

# Lab | API Scavenger Game

## Goals

### Challenge 1: Fork Languages

You will find out how many programming languages are used among all the forks created from the main lab repo of your bootcamp. Assuming the main lab repo is `ironhack-datalabs/madrid-oct-2018`, you will:

1. Obtain the full list of forks created from the main lab repo via Github API.

1. Loop the JSON response to find out the `language` attribute of each fork. Use an array to store the `language` attributes of each fork.
    * *Hint: Each language should appear only once in your array.*

1. Print the language array. It should be something like:

	```["Python", "Jupyter Notebook", "HTML"]```

Again, the documentation of Github API is [here](https://developer.github.com/v3/).

### Challenge 2: Count Commits

Count how many commits were made in the past week.

1. Obtain all the commits made in the past week via API, which is a JSON array that contains multiple commit objects.

1. Count how many commit objects are contained in the array.

## Deliverables

* `main.ipynb` that contains your solution to all the challenges.

## Submission

Upon completion, add your deliverables to git. Then commit git and push your code to the remote.

## Resources

[Github RESTFUL API Documentation](https://developer.github.com/v3/)

[OAuth](https://oauth.net/)

[Github oAuth Authorizations API](https://developer.github.com/v3/oauth_authorizations/)

[Github Other Authorizations API](https://developer.github.com/v3/auth/)

## Additional Challenge for the Nerds

So far we have practiced a lot with the `GET` method but not `PUT`, `POST`, `PATCH`, or `DELETE`. If you wonder what are the differences, refer to the following:

https://spring.io/understanding/REST

Simply put, the `GET` method only allows you to obtain data from API. But the other methods allow you to modify the data stored in the database behind the API. The API must be programmed to support each of these methods though.

The additional challenge for the nerds is for you to use the `PUT` method to create a file in your own repo. You need to grant the correct permissions to your access token in order to make `PUT` requests to your repo. 

### Note:

You don't have to use Python in this complex challenge. Simply find out how to do that with `curl` as proof of concept. That's adequate for the purpose of practicing `PUT` for API.

### Steps:

1. Create a new repo (don't use your forked repo for the lab because you don't want to ruin your lab codes). Assuming your repo is called `johndoe/test-repo`.

1. Call the following API endpoint to create a new file called `test.txt`: 

	```https://api.github.com/repos/johndoe/test-repo/contents/test.txt```

	Notes:

	* You'll need to supply a JSON object as the parameter of the `PUT` method that contains at least `message` and `content`.

	* The `content` string must be encoded with [Base64](https://en.wikipedia.org/wiki/Base64). Here is a website for you to [encode a regular string to Base64](https://www.base64encode.org/).

	For detailed documentation, see: https://developer.github.com/v3/repos/contents/#create-a-file

1. If successful, you should see the following example response from the API:

```
{
  "content": {
    "name": "test.txt",
    "path": "test.txt",
    "sha": "0d5a690c8fad5e605a6e8766295d9d459d65de42",
    "size": 20,
    "url": "https://api.github.com/repos/johndoe/test-repo/contents/test.txt?ref=master",
    "html_url": "https://github.com/johndoe/test-repo/blob/master/test.txt",
    "git_url": "https://api.github.com/repos/johndoe/test-repo/git/blobs/0d5a690c8fad5e605a6e8766295d9d459d65de42",
    "download_url": "https://raw.githubusercontent.com/johndoe/test-repo/master/test.txt",
    "type": "file",
    "_links": {
      "self": "https://api.github.com/repos/johndoe/test-repo/contents/test.txt?ref=master",
      "git": "https://api.github.com/repos/johndoe/test-repo/git/blobs/0d5a690c8fad5e605a6e8766295d9d459d65de42",
      "html": "https://github.com/johndoe/test-repo/blob/master/test.txt"
    }
  },
  "commit": {
    "sha": "16f2907406174e8068ecf976fb6abc24f004a62b",
    "node_id": "MDY6Q29tbWl0MTQ3NjgxMjMyOjE2ZjI5MDc0MDYxNzRlODA2OGVjZjk3NmZiNmFiYzI0ZjAwNGE2MmI=",
    "url": "https://api.github.com/repos/johndoe/test-repo/git/commits/16f2907406174e8068ecf976fb6abc24f004a62b",
    "html_url": "https://github.com/johndoe/test-repo/commit/16f2907406174e8068ecf976fb6abc24f004a62b",
    "author": {
      "name": "John Doe",
      "email": "john.doe@gmail.com",
      "date": "2018-10-30T04:37:34Z"
    },
    "committer": {
      "name": "John Doe",
      "email": "john.doe@gmail.com",
      "date": "2018-10-30T04:37:34Z"
    },
    "tree": {
      "sha": "116ad37d3680a79ef1cf9f555abb0579e293f5b4",
      "url": "https://api.github.com/repos/johndoe/test-repo/git/trees/116ad37d3680a79ef1cf9f555abb0579e293f5b4"
    },
    "message": "test",
    "parents": [
      {
        "sha": "1ab3d7a806e0a44f39ffbb63618fb26938f968ac",
        "url": "https://api.github.com/repos/johndoe/test-repo/git/commits/1ab3d7a806e0a44f39ffbb63618fb26938f968ac",
        "html_url": "https://github.com/johndoe/test-repo/commit/1ab3d7a806e0a44f39ffbb63618fb26938f968ac"
      }
    ],
    "verification": {
      "verified": false,
      "reason": "unsigned",
      "signature": null,
      "payload": null
    }
  }
}
```
