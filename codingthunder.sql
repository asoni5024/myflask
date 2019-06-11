-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2019 at 09:21 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codingthunder`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `srno` int(255) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(15) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`srno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'first post', 'firstpost@gmail.com', '123456', 'first post', '0000-00-00 00:00:00'),
(2, 'second post', 'asoni5024@gmail.com', '123456', 'second message', '2019-06-01 13:19:29'),
(3, 'aman', 'asoni5024@gmail.com', '9808570968', 'thisn ju uju ui ujmmi', '2019-06-01 15:54:26'),
(4, 'aman', 'asoni5024@gmail.com', '9808570968', 'khxcvlvegverlv rftb f m rvrhkv', '2019-06-01 15:57:49'),
(5, 'manoj', 'mkumar@gmail.com', '564899796', 'fdiwdwphdpwyduowhd0ywdod', '2019-06-01 17:14:14'),
(7, 'manoj kumar', 'mkumar.sgnr96@gmail.com', '8239648338', 'dADSadsADSasd', '2019-06-01 17:22:48'),
(9, 'Ashish Gupta', 'ashishgr1800@gmail.com', '8077577055', 'Hii How r u', '2019-06-03 12:20:57'),
(10, 'Ashu Gupta', 'ashu123@gmail.com', '7635396139', 'Hii Aman where are u', '2019-06-04 12:07:18');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `srno` int(255) NOT NULL,
  `title` text NOT NULL,
  `subheading` text NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`srno`, `title`, `subheading`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Death Stranding Release Date Set for November 8, Pre-Orders Go Live and Editions Detailed', 'Death Stranding Collector’s Edition is the one for eager fans, and yes, the reward is creepy.', 'first-post', 'Death Stranding, the highly-anticipated game from celebrated game video game creator and designer Hideo Kojima, finally has a release date. The PlayStation-exclusive action game has been officially confirmed to release on November 8, and has already gone up for pre-orders on the PlayStation Store. A total of four Death Stranding game editions have been confirmed so far, with add-ons ranging from in-game items to goodies like a cargo case and a life-sized BB Pod Statue, complete with a baby inside it. And yes, it is the same creepy baby that we\'ve seen in Death Stranding\'s trailers.\r\n\r\nJust a day after Death Stranding\'s latest trailer dropped, the release date of Kojima\'s next game featuring motion work by the likes of Norman Reedus, Mads Mikkelsen, and Oscar winner Guillermo Del Toro has finally been confirmed for eager fans. The PlayStation Store currently lists the release date as November 8, classifying the game as an action/ adventure title and putting up a PEGI-18 rating before it.\r\n\r\nAs mentioned above, Death Stranding will be available in four editions. The standard Death Stranding Digital Edition is priced at $59,99, while its listing on the PlayStation Store India pegs the asking price at Rs. 3,999. The game\'s Digital Deluxe Edition carries a price tag of $79.99, and is now up for pre-order from the PlayStation Store India as well for Rs. 4,799.', 'death-stranding.jpg', '2019-06-05 18:00:58'),
(3, 'Why iPhone users may soon delete Google Maps?\r\n\r\n', 'The software that powers the iPhone and with it showcased Maps in a new avatar. \r\n\r\n', 'third-post', 'California: Even for the ardent Apple fans out there, the go to navigation app has been Google Maps. If there’s an app when it comes to Maps. At WWDC 2019, the Cupertino-based tech giant unveiled iOS 13 – the software that powers the iPhone and with it showcased Maps in a new avatar. \r\n\r\n\r\n\r\n\r\n\r\n\r\n', 'iphone.jpg', '2019-06-04 15:53:48'),
(4, 'Samsung Launches \'World\'s First QLED 8K TV\' in India, Starting at Rs. 10,99,900.', 'Apart from QLED 8K, the company also updated its QLED TVs for 2019.', 'fourth-post', 'Samsung India on Tuesday announced the launch of the \"world\'s first QLED 8K TV\" in the country, the Samsung QLED 8K TV. This is a new industry benchmark in TV technology and is targeted at luxury homes. Of course, the key highlight of the TV is its real 8K Resolution, 8K AI Upscaling, Quantum Processor 8K, and Quantum HDR, as they all work in tandem to give a \'stunning 8K experience.\' There are four sizes on offer for the Samsung QLED 8K TVs; 98-inch (247 cm), 82-inch (207 cm), 75-inch (189cm) and 65-inch (163 cm) that come with 33 million pixels, four times the resolution of 4K UHD TVs and 16 times the resolution of full-HD TVs, allowing for an immersive viewing experience.\r\n\r\nThe Samsung QLED 8K TVs have been priced at Rs. 10,99,900 for the 75-inch model, Rs. 16,99,900 for the 82-inch model, and Rs. 59,99,900 for the 98-inch model. The 98-inch model will only be made to order, while the price for the 65-inch (available for purchase in July) will be announced shortly.', 'samsung.jpg', '2019-06-04 16:03:22'),
(5, 'iOS 13 Will Let You Silence Unknown Callers to Help Combat Pesky Calls.', 'Silence Unknown Callers will automatically divert an unidentified caller to voicemail.', 'fifth-post', 'iOS 13 will bring a number of new features and enhancements for iPhone and iPod and Apple talked about a few of them during the WWDC keynote on Monday. However, there is a one nifty little feature that wasn\'t highlighted by the company during the keynote but is likely to make a lot of difference to millions of iPhone users around the world. This feature is called Silence Unknown Callers. As the name suggests, the new feature is aimed at helping users avoid spam. It will be a godsend for iPhone users plagued with spam callers every day.\r\n\r\nAs per the iOS 13 features page on Apple website, Silence Unknown Callers is a new setting, which, when turned on, will use Siri intelligence to allow calls to ring your phone from numbers in your Contacts, Mail, and Messages. It will automatically send all other calls to voicemail. This will help users avoid spam and telemarketing calls. If the feature description is any indication, all non-recognised numbers will not even ring, thus providing an uninterrupted experience to the iPhone users.', 'ios_13.webp', '2019-06-04 16:06:12'),
(6, 'OnePlus 7 Gets Its First Update, Said to Improve Photo Quality; Also Adds April Security Patch, DC Dimming, and Fnatic Mode.', 'The OnePlus 7 did not have the DC Dimming and Fnatic Gaming mode at launch', 'sixth-post', 'The OnePlus 7 went on sale in India today at 12pm (noon) at a starting price of Rs. 32,999 for the base 6GB RAM/ 128GB variant. Consumers have been waiting for this smartphone since its launch last month. At the current price, it is the most affordable smartphone that is powered by a Qualcomm Snapdragon 855 SoC. OnePlus has now rolled out the first software update for this smartphone and it should reach retail units soon after they are unboxed.\r\n\r\nThe update brings OxygenOS 9.5.4.GM57AA to the OnePlus 7 ? 32,999 (Review) and it is 223MB in size. It claims to improve the camera performance of the smartphone, bring tweaks for smooth scrolling and an optimised algorithm for in-display fingerprint unlock sensor, apart from \"general bux fixes and improvements\". OnePlus is also bringing a DC Dimming feature to the OnePlus 7 along with Fnatic Gaming mode. These two features weren\'t available on the OnePlus 7 before the update and were exclusive to the OnePlus 7 Pro.', 'One.webp', '2019-06-04 16:09:27'),
(7, 'Facebook Investors Seek Independent Chair, Citing Vote Tally', 'Facebook is under pressure from investors over data privacy issues and its role in elections, which have attracted scrutiny from regulators.', 'sev-post', 'Public pension fund leaders on Tuesday called for separating the chairman and chief executive officer positions at Facebook, both held by co-founder Mark Zuckerberg, citing a vote that showed strong support for the idea among outside investors in the world\'s largest social media company.\r\n\r\n\"Facebook\'s insular boardroom must be cracked open because the company has no accountability to its users, its investors, or our democracy,\" said New York City Comptroller Scott Stringer in an e-mailed statement.\r\n\r\nIn a separate statement, Illinois State Treasurer Michael Frerichs said that \"Facebook\'s independent investors agree that it\'s time for the company to separate the Board Chair and CEO roles. Right now, Mr. Zuckerberg is both Board Chair and CEO, serving as his own boss, and clearly it\'s not working.\"\r\n\r\nA Facebook representative declined to comment on the remarks, or on similar comments made by the treasurers of Connecticut, Rhode Island and Pennsylvania.', 'facebook.jpg', '2019-06-05 14:00:20'),
(8, 'Asus TUF Gaming FX705DT, TUF Gaming FX505DT Laptops Launched in India', 'ASUS TUF Gaming FX705DT features a 17.3-inch Full HD display, whereas TUF Gaming FX505DT packs a 15.6-inch screen.', '8th-post', 'Taiwanese tech major Asus on Monday unveiled its new TUF gaming laptops FX505DT and FX705DT with the latest AMD Ryzen processor and NVIDIA GeForce GTX GPUs with up to 120Hz IPS-level NanoEdge display in India at a starting price of Rs 64,990. The TUF FX505DT gaming laptop is equipped with a 15.6-inch full-HD display with a resolution of 2160x1080 pixels. The display features a 1200Hz screen refresh rate.\r\n\r\n\"At Asus, we are glad to unveil the TUF gaming Laptops FX505DT and FX705DT that combine amazing processing power and graphics upgrade with durability.\r\n\r\n\"Available at affordable prices, we are affirmative that these laptops will prove to be suitable partners to India\'s growing brigade of passionate gamers and multi-tasking individuals,\" Arnold Su, ROG and PC Head at Asus India, said in a statement.\r\n\r\nThe Asus TUF Gaming FX705DT features a 17.3-inch full-HD display with 60Hz refresh rate. The FX505DT is powered by 32GB of DDR4 2666 MHz RAM while the FX705DT is powered by up to 32GB of DDR4 2400 MHz RAM. The FX505DT also comes with up to 256GB SSD+1TB SSHD storage while the FX705DT features a 512GB SSD+1TB SSHD storage.\r\n\r\n', 'asus_tuf.webp', '2019-06-06 12:15:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`srno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`srno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `srno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `srno` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
