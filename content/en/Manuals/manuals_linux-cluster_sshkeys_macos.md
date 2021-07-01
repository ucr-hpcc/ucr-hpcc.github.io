---
layout: page
title: Linux Cluster - SSH Keys Apple macOS 
permalink: manuals_linux-cluster_sshkeys_macos.html
---

## SSH Keys on macOS

### What are SSH Keys?

SSH (Secure Shell) keys are an access credential that is used in the SSH protocol.

The private key remains on the system being used to access the HPCC cluster and is used to decrypt information that is exchanged in the transfer between the HPCC cluster and your system.

A public key file is used to encrypt information, and is stored on your own system.
The public key file is stored on the HPCC cluster and contains a list of authorized public keys.

### Why do you need SSH Keys?

HPCC supports two authentication methods; `Password+DUO` and `SSH Keys`.
The `Password+DUO` method requires a UCR NetID, if you do not have this then you will need to use `SSH keys` in order to access the HPCC cluster.

### What you need

#### Filezilla

You will need to install `Filezilla` in order to transfer the public SSH key to the HPCC cluster.

1. Download the `Filezilla Client` for Mac OS X [here](https://filezilla-project.org).
	* Make sure your Mac OS X system is updated to the latest version.
2. Follow the install wizard to complete the install of `Filezilla`.

#### Sourcetree

You will need to install `Sourcetree` in order to generate your `SSH keys` (or use the command line method mentioned here: [Manage SSH Keys via Command Line](some_other_page).

1. Download `Sourcetree` from [here](https://www.sourcetreeapp.com).
2. Click on `Download for Mac OS X`.
3. Install `Sourcetree`.

### Create SSH Keys (`Sourcetree`)

1. Open the `Sourcetree` application and under the top `Sourcetree` menu click on the `Preferences...` sub-menu item.

   ![fig0](images/41.png)
   
2. Navigate to `Accounts` category and click on `Add...`.

   ![fig0](images/42.png)

3. Click on `Auth Type:` and change the drop down menu from `OAuth` to `Basic`. Make sure `Protocol:` is set to `SSH` in the drop down menu.

   ![fig0](images/43.png)

4. Enter `id_rsa` in the `Username` field.

   ![fig0](images/44.png)  
 
 
5. Click the `Generate Key` button.
   
   ![fig1](images/50.png)  
 
6. Press `Cancel` to exit out of the window.

### SSH Keys Location

By default, your key files are created in the path: `/Users/macOSUsername/.ssh/`.

To verify that the keys were created, do the following:

1. Open a new finder window. Click on your home directory on the left side pane.
   
   ![fig1](images/23.png)

2. Press the 3-button combo `Command`+`Shift`+`.` together (visualized below) to see hidden folders:
   
   ![fig1](images/47b.png)
 
3. You will now be able to see your `.ssh` folder, open it by double-clicking.
   
   ![fig1](images/48.png)

4. You should see your newly generated pair of `SSH key` files in the folder. 

   ![fig1](images/51.png)

5. Sourcetree adds the `-Bitbucket` to the end of the `SSH key` file names. Remove this by clicking on the file you want to rename and press the `Enter` key which allows us to rename the file before the extension.

   ![fig1](images/52.png)

6. After you have removed the `-Bitbucket` suffix from each of the `SSH key` file names, your new `SSH key` file names should be `id_rsa` and `id_rsa.pub`.

   ![fig1](images/53.png)

### Configure SSH Keys

#### Public SSH Key

Now that you have created your `SSH keys`, and renamed them, you will need to placed the public key (`id_rsa.pub`) on the cluster using the `cluster.hpcc.ucr.edu` server.

1. Start the `Filezilla` application.

2. Fill in the `Quickconnect` fields at the top of the application window:

   * Enter your HPCC username in the `Username` field.
   * Enter the HPCC servername `cluster.hpcc.ucr.edu` for the `Host` field.
   * Enter your password in the `Password` field.
   * Enter `22` in the `Port` field.

   ![fig4](images/1e.png)

6. Click on `Quickconnect`

   ![fig7](images/8e.png)

7. If a pop up prompts you to save your password, select the `Save passwords` option, then click the `OK` button.

8. If the next pop up prompts you, then check the box that states `Always trust this host, add this key to the cache`, then click the `OK` button.

   ![fig8](images/6be.png)

9. Now that you are connected to Filezilla transfer your public SSH key from your macOS system by dragging the file `/Users/macOSUsername/.ssh/id_rsa.pub` and dropping it into the HPCC cluster direcotry `/rhome/username/.ssh/`.

   ![fig10](images/4e.png)


#### Private SSH Key

Once your public key is in place, now you can configure `Filezilla` to use your private `SSH key` and connect to the cluster through the `secure.hpcc.ucr.edu` server.

1. Open Filezilla `Site Manager` button in the top bar of icons.

   ![fig3](images/60.png)

2. Click on `New Site`, rename it (optional) and press enter.

   ![fig3](images/54.png)

3. Make sure the following fields are correctly filled before adding your `SSH key` file:

   * `Protocol`: should be set to `SFTP - SSH File Transfer Protocol`
   * `Host`: type in `secure.hpcc.ucr.edu`
   * `Port`: type `22`
   * `Logon Type`: set to `Key file`
   * `User`: type in your HPCC username

   After these fields are finalized, click the `Browse..` button.

   ![fig4](images/56.png)

4. Navigate to the folder you saved your key file in (default location is `/Users/macOSUsername/.ssh`) and open the private key file `id_rsa`.

   ![fig4](images/57.png)
   
5. You should see the added keyfile in the `Key file:` box, then click `Connect`.

   ![fig5](images/59.png)

   Subsequnt connections can be done from the `Quickconnect` history by clicking on the down arrow to the right side of the `Quickconnect` button.

   ![fig5](images/61.png)

9. Remember to select the `secure.hpcc.ucr.edu` address.

   ![fig5](images/62.png)

10. Transfer files by double clicking or drag-n-drop. For more details regarding file transfers vist [Filezilla Usage](some_other_page).

