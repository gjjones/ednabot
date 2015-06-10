# Configures the plugin
module.exports = (robot) ->
    # waits for the string "hubot repos" to occur
    robot.respond /repos/i, (msg) ->
        # Configures the url of a remote server
        msg.http('https://api.github.com/users/ebsco/repos')
            # and makes an http get call
            .get() (error, response, body) ->
                # passes back the complete reponse
                repoNames = body.map (repo) -> repo.full_name
                msg.send repoNames.join ', '
