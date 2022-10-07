### 0-iam_betty
- su betty   => switch user

### 1-who_am_i
- whoami  => display current user

### 2-groups
- groups

### 3-new_owner
- chown betty hello   => change owner of hello file to betty

### 4-empty
- touch hello    => create hello file


### 5-execute
- chmod u+x   =>  change execute permission for owner

### 6-multiple_permissions
- chmod 554 hello  => set owner and group to read, execute and other read

### 7-everybody
- chmod 751  => set all to have execution access

### 8-James_Bond
- chmod 007   => set other to all permission

### 9-John_Doe
- chmod 753 => set all permission for owner, read-execute for group and write-execute for others

### 10-mirror_permissions
- chmod --reference=hello olleh  => copy the permission set for hello to olleh

### 11-directories_permissions
- chmod 111 .  => add execution access to owner, group and others of the file


