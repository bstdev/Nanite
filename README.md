[![Build Status](https://travis-ci.org/nanitecurrency/Nanite.svg?branch=master)](https://travis-ci.org/nanitecurrency/Nanite)


```
____   _________________________   ________ ___________
\   \ /   /\_   _____/\______   \ /  _____/ \_   _____/
 \   Y   /  |    __)_  |       _//   \  ___  |    __)_
  \     /   |        \ |    |   \\    \_\  \ |        \ 2018 Nanite/NTT
   \___/   /_______  / |____|_  / \______  //_______  /
                   \/         \/         \/         \/
```

# Nanite [NTT] Source Code

## Specifications

* PoW (proof of work)
* Algorithms: scrypt, x17, Lyra2rev2, myr-groestl, & blake2s
* Blocktime: 30 seconds
* Total Supply: 16.5 Billion NTT
* No pre-mine
* No ICO
* Blockreward:
  * Block 0 to 14,000 : 200,000 coins
  * 14,000 to 28,000 : 100,000 coins
  * 28,000 to 42,000: 50,000 coins
  * 42,000 to 210,000: 25,000 coins
  * 210,000 to 378,000: 12,500 coins
  * 378,000 to 546,000: 6,250 coins
  * 546,000 to 714,000: 3,125 coins
  * 714,000 to 2,124,000: 1,560 coins
  * 2,124,000 to 4,248,000: 730 coins
* RPC port: `20102`
* P2P port: `21102`

## Resources

* [Blockchain Explorer](https://nanite-blockchain.info/)
* [Mining Pool List](http://nanitecurrency.com/pools/)
* [Black Paper](https://nanitecurrency.com/assets/Nanite-Anonymity-Centric-CryptoCurrency.pdf)

### Community

* [Telegram](https://t.me/NaniteNTT)
* [Discord](https://discord.gg/nanitecurrency)
* [Twitter](https://www.twitter.com/nanitecurrency)
* [Facebook](https://www.facebook.com/Nanitecurrency/)
* [Reddit](https://www.reddit.com/r/nanitecurrency/)

## Wallets

Binary (pre-compiled) wallets are available on all platforms at [https://nanitecurrency.com](https://nanitecurrency.com/#wallets).

> **Note:** **Important!** Only download pre-compiled wallets from the official Nanite website or official Github repos.

> **Note:** For a fresh wallet install you can reduce the blockchain syncing time by downloading [a nightly snapshot](https://nanite-blockchain.com/down) and following the [setup instructions](https://nanite-blockchain.com/howto).

### Windows Wallet Usage

1. Download the pre-compiled software.
2. Install
3. In windows file explorer, open `c:\Users\XXX\AppData\Roaming\Nanite` (be sure to change XXX to your windows user)
4. Right click and create a new file `nanite.txt`
5. Edit the file to have the following contents (be sure to change the password)

    ```
    rpcuser=naniterpcusername
    rpcpassword=85CpSuCNvDcYsdQU8w621mkQqJAimSQwCSJL5dPT9wQX
    rpcport=20102
    port=21102
    daemon=1
    algo=groestl
    ```

6. Save and close the file
7. Rename the file to `nanite.conf`
8. Start the Nanite-qt program.
9. Open up Nanite-qt console and run `getinfo` (or `getmininginfo`) to verify settings.

> **Note:** You must re-start the wallet after making changes to `nanite.conf`.

### OS X Wallet

1. Download the pre-compiled software.
2. Double click the DMG
3. Drag the Nanite-Qt to your Applications folder
4. Install required `boost` dependency via homebrew

    ```shell
    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew install boost
    ```
5. Double click the Nanite-Qt application to open it.
6. Go grab a :coffee: while it syncs with the blockchain

> **Note:** It may look like it is frozen or hung while it is indexing and syncing the blockchain. It's not. It's chugging away, but currently the UI doesn't give you a lot of feedback on status. We're working to fix that. Syncing takes a while to complete (ie. > 10 minutes or more) so just be patient.

> **Note:** If you want to change your configuration the file is located at `~/Library/Application\ Support\Nanite\Nanite.conf`. This isn't required by default.

### Linux Wallet

1. Download the pre-compiled software.
2. Unpack it. The wallet GUI is in `./nanite/src/qt` and the daemon in `./nanite/src`.
3. **Optional** - the binaries to your favorite location. for use by all users, run the following commands:

    ```shell
    sudo cp src/Nanited /usr/bin/
    sudo cp src/qt/Nanite-qt /usr/bin/
    ```

4. Run `./Nanited` from wherever you put it. The output from this command will tell you that you need to make a `Nanite.conf` file and will suggest some good starting values.
5.  Open up your new config file that was created in your home directory in your favorite text editor

    ```shell
    nano ~/.Nanite/Nanite.conf
    ```

6. Paste the output from the `Nanited` command into the Nanite.conf like this: (It is recommended to change the password to something unique.)

    ```
    rpcuser=naniterpcusername
    rpcpassword=85CpSuCNvDcYsdQU8w621mkQqJAimSQwCSJL5dPT9wQX
    rpcport=20102
    port=21102
    daemon=1
    algo=groestl
    ```

7. Save the file and exit your editor. If using `nano` type `ctrl + x` on your keyboard and the `y` and hitting enter. This should have created a `Nanite.conf` file with what you just added.

8. Start the Nanite daemon again

    ```shell
    ./path/to/Nanited
    ```

> **Note:** To check the status of how much of the blockchain has been downloaded (aka synced) type `./path/to/Nanited getinfo`.

> **Note**: If you see something like 'Killed (program cc1plus)' run ```dmesg``` to see the error(s)/problems(s). This is most likely caused by running out of resources. You may need to add some RAM or add some swap space.

You can also check out this [Linux Wallet Video Tutorial](https://www.youtube.com/watch?v=WYe75b6RWes).

## Building From Source

* [Linux Instructions](doc/build-nanite-linux.md)
* [OS X Instructions](doc/build-nanite-osx.md)
* [Windows Instructions](doc/build-nanite-win.md)

## Developer Notes

Can be found [here](./doc/dev-notes.md)

## Docker Images

Check out the [`contrib/readme`](https://github.com/nanitecurrency/Nanite/tree/master/contrib/docker) for more information.

## Mining

### Solo mining

Instead of joining a mining pool you can use the wallet to mine all by yourself. You need to specify the algorithm (see below) and set the "gen" flag. For instance, in the configuration specify `gen=1`.

### Using different algorithms

To use a specific mining algorithm use the `algo` switch in your configuration file (`.conf` file) or from the command line (like this `--algo=x17`). Here are the possible values:

```
algo=x17
algo=scrypt
algo=groestl
algo=lyra
algo=blake
```

## Donations

We believe in keeping Nanite free and open. Any donations to help fuel the development effort are greatly appreciated! :smile:

* Address for donations in Nanite (NTT): `DDd1pVWr8PPAw1z7DRwoUW6maWh5SsnCcp`
* Address for donations in Bitcoin (BTC): `142r3vCAH3AzABiQjFPmcrSCp6TDzEDuB1`

## Special Shout Outs

Special thanks to the following people that have helped make Nanite possible. :raised_hands:

Sunerok, CryptoRekt, MKinney, BearSylla, Hypermist, Pallas1, FuzzBawls, BuZz, glodfinch, InfernoMan, AhmedBodi, BitSpill, MentalCollatz, ekryski and the **entire** #Nanite community!

