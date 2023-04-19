  provisioner "remote-exec" {
    inline = [
        "sudo adduser --disabled-password --gecos '' myuser",
        "sudo mkdir -p /home/myuser/.ssh",
        "sudo touch /home/myuser/.ssh/authorized_keys",
        "sudo echo '${var.MY_USER_PUBLIC_KEY}' > authorized_keys",
        "sudo mv authorized_keys /home/myuser/.ssh",
        "sudo chown -R myuser:myuser /home/myuser/.ssh",
        "sudo chmod 700 /home/myuser/.ssh",
        "sudo chmod 600 /home/myuser/.ssh/authorized_keys",
        "sudo usermod -aG sudo myuser"
   ]

    connection {
     user     = "ubuntu"
    }

  }