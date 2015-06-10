# Configures the plugin
module.exports = (robot) ->
    # waits for the string "hubot repos" to occur
    robot.hear /repos/i, (res) ->
        # Configures the url of a remote server
        res.http('https://api.github.com/users/ebsco/repos')
            # and makes an http get call
            .get() (error, response, body) ->
                repoNames = body.map (repo) -> repo.full_name
                repoNames = repoNames.join ', '
                res.send body

