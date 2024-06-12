# SSH into the server

file { '~/.ssh/config':
  ensure => present,
  mode   => '0600',
  content => "
        Host school
            HostName 54.209.217.152
            User your_username
            IdentityFile ~/.ssh/school
            PasswordAuthentication no
",

}
