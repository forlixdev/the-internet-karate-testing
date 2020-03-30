Feature: digest authentication

  Background:
    * def user = "admin"
    * def password = "admin"
    * def get_auth_url = function(fname) { return "http://" + user + ":" + password + "@" + host.replace("http://","") }
    * def full_url = get_auth_url()
    * print full_url
    * def authentication_success_sel = "#content > div > h3"

  Scenario: access to a url protected through a digest authentication
    Given driver full_url + '/digest_auth'
    Then match waitFor(authentication_success_sel).text == 'Digest Auth'



    







