-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 06, 2025 at 06:34 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(8) NOT NULL,
  `email` varchar(88) NOT NULL,
  `product_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `email`, `product_id`) VALUES
(4, 'satyam123@gmail.com', 14),
(5, 'satyam123@gmail.com', 35),
(7, 'satyam123@gmail.com', 27),
(8, 'kartik12@gmail.com', 1),
(9, 'kartik12@gmail.com', 15),
(10, 'chanchal12@gmail.com', 2),
(11, 'chanchal12@gmail.com', 5),
(14, 'yash123@gmail.com', 0),
(20, 'vivekkunwar07@gmail.com', 46),
(21, 'vivekkunwar07@gmail.com', 6);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(8) NOT NULL,
  `cat_name` varchar(88) NOT NULL,
  `cat_alias` varchar(88) NOT NULL,
  `cat_details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `cat_name`, `cat_alias`, `cat_details`) VALUES
(1, 'T-Shirts', 't_shirts', ''),
(2, 'Shirts', 'shirts', ''),
(3, 'Jackets', 'jackets', ''),
(4, 'Shoes', 'shoes', ''),
(5, 'Jeans', 'jeans', ''),
(6, 'Watches', 'watches', ''),
(7, 'Sun Glasses', 'sun_glasses', '');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(8) NOT NULL,
  `name` varchar(88) NOT NULL,
  `email` varchar(155) NOT NULL,
  `password` varchar(88) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `password`, `address`) VALUES
(3, 'rahul', 'rahul123@gmail.com', '', ''),
(4, 'Kartik', 'kartik12@gmail.com', '1111', ''),
(5, 'kartik', 'kartik@123gmail.com', '1111', ''),
(6, 'chanchal', 'chanchal12@gmail.com', '1234', '');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `msg_id` int(11) NOT NULL,
  `incoming_msg_id` int(255) NOT NULL,
  `outgoing_msg_id` int(255) NOT NULL,
  `msg` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(8) NOT NULL,
  `date` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `address` varchar(220) NOT NULL,
  `amount` int(8) NOT NULL,
  `shipper_id` int(8) NOT NULL,
  `status` varchar(20) NOT NULL,
  `order_number` varchar(155) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `date`, `email`, `address`, `amount`, `shipper_id`, `status`, `order_number`) VALUES
(1, '1737535807', 'Vivek123@gmail.com', 'b-90', 4300, 3, 'pending', 'hpGNMEJmlQrBvNMP87Eu'),
(2, '1739447583', 'vivekkunwar07@gmail.com', 'H-145', 2100, 1, 'pending', '1ICd33nsCUcuwTDVNDFi'),
(3, '1739601301', 'vivekkunwar07@gmail.com', 'b-92', 4300, 3, 'pending', 't0RMPaDWzlDPEQy7BXFQ'),
(4, '1740803946', 'vivekkunwar07@gmail.com', 'H-320', 1600, 1, 'pending', 'bfJKS0VD0yAKDlaFEoof'),
(5, '1740803978', 'vivekkunwar07@gmail.com', 'H-320', 100, 1, 'pending', 'zegiXySV98OVRdQrribn');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(15) NOT NULL,
  `product_id` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`) VALUES
(1, 1, 0),
(2, 1, 0),
(3, 1, 11),
(4, 2, 43),
(5, 3, 11),
(6, 4, 7);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(8) NOT NULL,
  `pr_name` varchar(88) NOT NULL,
  `cat_id` int(8) NOT NULL,
  `pr_alias` varchar(88) NOT NULL,
  `pr_desc` text NOT NULL,
  `pr_image` varchar(150) NOT NULL,
  `pr_price` int(11) NOT NULL,
  `pr_sale_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `pr_name`, `cat_id`, `pr_alias`, `pr_desc`, `pr_image`, `pr_price`, `pr_sale_price`) VALUES
(5, 'Team India PRINTED T-shirt', 1, 'indian_team_jersey printing%20t-shirts.jpeg', 'When it comes to writing t-shirt product descriptions, using descriptive language is crucial. Instead of using generic terms like “cotton t-shirt,” use words that evoke emotion and create a sense of desire for the product. For example, you can use phrases like “luxurious cotton,” “soft and comfortable,” or “slim-fit design.”', 'cricket-tshir-3t.jpg', 1200, 850),
(6, 'FORMAL SHIRT', 2, 'formal_shirt', 'Therefore, it is critically important that you find a dress shirt that complements your personal style, body, and wardrobe. There are, however, a shocking number of styling options for men’s dress shirts. On the one hand, this reality should enable every man to find a great fit and style that works for his needs, but on the other, it can be daunting to wade through all the details.', 'tshirt-2.jpg', 2500, 1400),
(7, 'CHECK SHIRT', 1, 'check_shirt', 'We have highlighted 9 checkered shirt patterns here, which is a lot of information to digest! So to summarize: 1. For more formal work events, graph checks, pin checks, windowpane and shepherd checks are … S', 'checkshirt.jpg', 2500, 1555),
(8, 'DENIM SHIRT', 2, 'demin_shirt', 'We use first- and third-party cookies including other tracking technologies from third party publishers to give you the full functionality of our website, customize your user experience, perform analytics and deliver personalized advertising on our websites, apps and newsletters across internet and via social media platforms. For that purpose, we collect information about user, browsing patterns and device.', 'f134a76f-64c3-461f-b2a3-ef25200dee70.jpg', 2500, 1750),
(9, 'PRINTED SHIRT', 2, 'printed_shirt', ' Superior Cotton Fabric: Crafted from premium 100% cotton (180 GSM), striking the perfect balance between softness and endurance for everyday wear.\r\n- Expert Craftsmanship: Meticulous attention to detail guarantees durability and a timeless appeal.\r\n- Enhanced Comfort: Engineered with advanced stretch technology, offering luxurious comfort and an impeccable fit for a polished appearance throughout the day.\r\n- Effortless Maintenance: Easy to launder and wrinkle-resistant, simplifying your laundry routine, while integrated odor resistance keeps the garment fresh.', 'IMG-20240521-WA0034.jpg', 2500, 2000),
(10, 'HALF SLEEVE SHIRT', 2, 'half_sleeve_shirt', 'Modern Oversized Fit: Embrace a contemporary style with our men\'s polo t-shirt featuring a trendy oversized fit, providing both comfort and fashion-forward appeal.\r\nTextured Fabric: Elevate your wardrobe with a unique textured fabric that adds depth and dimension to your look. The tactile details make this polo shirt stand out from the rest.\r\nPremium Comfort: Crafted from high-quality materials, our polo shirt ensures a soft and comfortable feel against the skin. Enjoy all-day comfort without compromising on style.', 'IMG-20240521-WA0036.jpg', 2500, 1550),
(11, 'DENIM JACKETS', 3, 'denim_jackets', 'Material Composition: 100% Cotton; Pattern: Washed\r\nSleeve Type: Long Sleeves; Jacket Style; Retro Denim\r\nComfort & Fit: Designed in a slim fit that is comfortable and provides ultimate comfort and style throughout the day. Available in various sizes and colour options, these jacket will become your favorite steal in the wardrobe', 'IMG-20240521-WA0037.jpg', 5000, 4000),
(12, 'FIELD JACKETS', 3, 'field_jackets', 'Green solid the iconic field jacket with patchwork, has a mock collar, 4 pockets, has a button closure, regular, long sleeves, straight hem\r\nFeatures\r\nMock neck with a hook-and-loop tab at the front. Stowaway hood with embroidered eyelets and a built-in brim\r\nFull-zip front. Snapped storm placket. Long sleeves with buttoned barrel cuffs. Buttoned shoulder epaulets with flower patches. Ventilating embroidered eyelets at the underarms\r\nTwo chest snapped pockets. Two front waist snapped pockets. Interior left chest pocket', 'IMG-20240521-WA0035.jpg', 5000, 3500),
(13, 'BOMBER JACKETS', 3, 'bomber_jackets', 'RCS CERTIFIED RECYCLED POLYESTERNowadays, recycled polyester is mainly made from PET plastic waste. This is a type of plastic that is widely used in a variety of items, such as plastic bottles. Using recycled materials helps limit the production of virgin polyester fibre. It is certified to the Recycled Claim Standard (RCS), which verifies the recycled content and tracks it from source to final product.', 'bomer-Jacket-3.jpg', 5000, 3000),
(14, 'TRUCKER JACKETS ', 3, 'trucker_jackets', 'FUNCTIONALITY: Dual closure with center front zipper and snaps; Two chest pockets with snap closures; welt chest zipper pocket and two lower welt pockets; hidden interior pocket for added storage and security\r\nSTYLISH FEATURES: Stand up collar with adjustable zipper detailing; adjustable snap cuffs and epaulettes on shoulders for added comfort; inner quilted lining\r\nVERSATILITY: The 100% cotton fabric allows the jacket to be lightweight and the perfect staple piece in every man’s closet; This is the go-to jacket to transition through the seasons', 'IMG-20240521-WA0013.jpg', 5000, 3200),
(15, 'MOTO JACKETS', 3, 'moto_jackets', 'Material Composition: Made from 100% polyester, known for its lightweight yet durable properties, making it ideal for a riding jacket that balances protection and comfort.\r\nBreathability: Polyester’s inherent breathability helps maintain airflow, keeping the rider comfortable during extended rides. Mesh inserts and ventilation panels further enhance this feature.\r\nStylish Design: Available in a range of colors and styles to suit individual preferences, often designed with a sleek, modern look suitable for various riding scenarios.\r\nStorage Options: Typically designed with multiple pockets, both inside and out, providing ample space for essentials like smartphones, wallets, and keys. Zippered closures ensure secure storage.', 'IMG-20240521-WA0014.jpg', 5000, 3800),
(16, 'CHELSEA BOOTS SHOES', 4, 'chelsae_boots_shoes', 'Classic Chelsea ankle boots come with elasticized straps on both sides, suitable for people with different foot sizes.\r\nWomen\'s ankle boots have a non-slip rubber sole and soft lining to keep your feet comfortable.\r\nWomens low heel ankle booties have a heel height of about 1.7 inches, which is a stylish and comfortable height.\r\nWomen\'s platform chunky heel boots come in a variety of material options, with premium leather for a more trendy look.\r\nChelsea style ankle boots are suitable for many occasions, can be paired with jeans, shorts, skirts and so on, let you enjoy, a fashionable boot to own in spring, summer, fall and winter.', 'IMG-20240521-WA0015.jpg', 6000, 4000),
(17, 'LOAFERS SHOES', 4, 'loafers_shoes', 'Premium Faux Leather: Our loafers are made from high-quality faux leather, providing a durable and stylish finish that looks and feels like genuine leather.\r\nClassic Design: The timeless design of these loafers offers a touch of elegance, making them suitable for both formal and casual occasions.\r\nComfortable Fit: The cushioned insole and soft lining ensure all-day comfort, allowing you to stay on your feet without any discomfort.\r\nSlip-On Convenience: With their slip-on design, these loafers offer effortless wearability, making them convenient for busy individuals.\r\nEasy Slip-on Construction: These loafers are designed with a slip-on style, allowing for quick and effortless wear. The slip-on feature adds convenience to your daily routine, making them an ideal choice for those who are always on the go.', 'IMG-20240521-WA0016.jpg', 6000, 4500),
(18, 'OXFORD SHOES', 4, 'oxford_shoes', 'Shoes are made from very high-quality material, we never compromise with quality, are fully dedicated to providing the highest quality product.\r\nStylish, flexible and comfort dress shoes perfect for wedding,business,work,formal and casual.\r\nThe Comfortable dress shoe is suitable not only for work,but also for formal occasions like wedding\r\nEASY TO MATCH - This Shoes for men have classic color matching designed, easy to match clothing. You can worn this shoes with jeans, casual pants, cropped pants and shorts. Perfect for any occasions.\r\nDesigned to be your favorite Shoe for all occasions, Wally Free embodies the lifestyle by combining your passion for comfort, quality, and fashion. this casual features highly flexible stretch materials and a maximum cushioned insole.\r\n', 'IMG-20240521-WA0017.jpg', 6000, 3500),
(19, ' DERBY SHOES', 4, 'derby_shoes', 'SOLE: Thermoplastic Elastomers & CLOSURE: Lace-Up.\r\nMATERIAL: Shoes from Auserio are made with suede leather. It is breathable, heat-insulating, stretchy, tearproof and abrasion-resistant and acts a barrier against moisture evaporation. Finished suede leather combined with the fully lined supple glove interior that can keep your foot comfortable.\r\nSTYLE: Derbies are often known as \'open lacing\', Crafted with Integrity, Most suitable office shoes for men, mens dress shoes, mens wedding shoes, mens casual dress shoes.\r\nCOMFORTABLE FEEL: The shoes from Auserio comes with extra padding for premium feel and appearance. Cork-Bed midsoles that form to your feet with antimicrobial shock absorbing insoles. It provides arch support so you can wear whole day without feeling tired.\r\nDESIGN: Lace-up premium waxed cotton laces with antimicrobial shock absorbing insoles. The outsoles are anti-skid and provide grip on a surface. We have a padded collar in our shoes.', 'IMG-20240521-WA0018.jpg', 6000, 3000),
(21, 'DEMIN JEANS', 5, 'denim_jeans', 'FABRIC: The TURMS Denim Jeans are typically made from a blend of high-quality materials This fabric combination helps to provide durability, stretchability, and comfort.\r\nANTI STAIN: The jeans might be treated with a special finish or coating that helps repel liquids and prevent stains from setting in. This feature can be beneficial during travel when access to laundry facilities may be limited.\r\nANTI-ODOR TECHNOLOGY: The fabric used in the jeans may have properties that inhibit the growth of odor-causing bacteria, helping to keep the jeans fresh for longer periods between washes\r\nWATER REPELLENTWATER REPELLENT: The treatment on our products creates a barrier on the fabric surface which causes water droplets to bead up and roll off the material, this helps to maintain the breathability of the fabric too.\r\nTRAVEL-FRIENDLY DESIGN: The jeans may feature elements that make them suitable for travel, such as wrinkle resistance, quick-drying properties, or lightweight construction. These features can enhance comfort and convenience while on the go.', 'IMG-20240521-WA0020.jpg', 3000, 2500),
(22, 'BAGGY JEANS', 5, 'baggy_jeans', 'Loose Fit: Ben Martin Loose Fit Jeans Pant Designed for comfort and a relaxed style.\r\nDenim Material: Durable and classic denim fabric for a timeless look of this Baggy Jeans for Men.\r\nAvailable Sizes: This Mens Jeans comes Range of sizes & Colors to suit different body types. 28 to 40. Dark Blue, Light Blue, Grey, Black & White\r\nVersatile: This Oversized Mens Jeans Versatile and can be paired with various tops. Like Tshirt, Tees, Sweatshirts & Even Shirts\r\nFeature: This Baggy Fit Jeans for Men 1) Comfortable for all-day wear. 2) Casual and laid-back style. 3) side pockets for added functionality. 4) vailable in different washes and finishes.', 'IMG-20240521-WA0021.jpg', 3000, 2000),
(23, 'SLIM FIT JEANS', 5, ' slim_fit_jeans', 'Made of 12oz premium denim fabric - 53% Cotton, 46% Polyester & 1% Elastane\r\nA special hollow fiber with 10% more volume and 10% less weight than regular denims, perfect for extreme weather or travel ease\r\nThis jeans has a unique knit structure at reverse of the fabric\r\nThis Air-Lite fiber comes with a soft hand feel and moisture management properties\r\nSymbol Premium\'s easy stretch jeans feature \'Air-Lite\' hollow fiber, providing a unique blend of style, comfort. A desirable choice for denim lovers seeking both fashion and functionality in their wardrobe', 'IMG-20240521-WA0022.jpg', 3000, 2200),
(24, 'CARGO JEANS', 5, 'cargo_jeans', 'Fabric & Fit Type: Made with 100% cotton, the denim fabric ensures a comfortable fit throughout the day. With double reinforced front, back and side seams, these Loose Fit jeans lend you a distinct appeal.\r\nThoughtful Construction: This mid rise jeans for men in regular length, have zip fly and button closure\r\nVersatile Style: Hubberholme offers washed non-stretch loose fit cargo jeans for a timeless look. Perfect for casual occasions, outings, and outdoor activities. Available in a variety of sizes and colors to suit your personal style.\r\nFunctional Pockets: 6 Pocket Jeans with 2 side curved pockets, 2 back patch pockets, 2 flap cargo pockets are easy to use and can carry your essentials on the go. This further improves the functionality of these retro jeans.\r\nEasy to Care for: Machine wash, do not bleach, dry in shade, wash with similar colors; Country of Origin: Proudly made in India', 'IMG-20240521-WA0023.jpg', 3000, 1800),
(26, 'ANALOGS WATCHES', 6, 'analogs_watches', 'HIGH QUALITY CRAFTMANSHIP:Elevate your style game with our Timeless Sophistication Men\'s Watch. A perfect blend of classic design and modern flair, this watch embodies refined elegance. Its sleek stainless steel case encases a bold yet minimalist dial, Be it a formal affair or a casual outing, this watch effortlessly complements every look, making it a must-have in every gentleman\'s collection.\r\nWATER RESISTANT: Upto 3ATM this watch is engineered to withstand sweat, rain, and splashes. Suitable for all kinds of business, leisure, indoor activities or daily use. Not Suitable for swimming or bathing.\r\nPERFECT GIFT: Celebrate his unique style and sophistication with our meticulously crafted Fashion Watch, the ultimate gift that embodies elegance and functionality. Its sleek design, featuring a refined dial and a complementing bracelet making it a versatile addition to any wardrobe. Whether marking a milestone, expressing appreciation, or simply celebrating man you admire, watch symbolizes the essence of a thoughtful gift. Its versatility allows it to effortlessly transition from day to night.\r\n100% SATISFACTION GUARANTEE: 1 Year Domestic Warranty from any manufacturing defects.This warranty is valid from date of purchase ands only with proof of purchase. Battery,Straps, Plating and Waterproofing are not covered under warranty. Quality is our 1st priority we do not compormise on quality.', 'IMG-20240521-WA0024.jpg', 4000, 3500),
(27, 'FAST TRACK DIGITAL WATCHES', 6, 'digital_watches', 'Best Quality T_Shirts1.78\" AMOLED display: See your world in utmost clarity on the 1.78’’ AMOLED display with 368*448 pixel resolution.Always on Display: Take your pick from a plethora of Always On Display watch faces and see your day unfold.Functional crown: Navigate your way through a series of features with ease, thanks to the fully functional digital crown.Tru Sync: Get the best-in-class calling experience with the Tru Sync feature that ensures a stable and fast connection every single time.Noise Buzz: Stay connected with the world throughout the day via the Noise Buzz feature that gives you access to a dial pad, call logs and the option to save up to 10 contacts.Gesture control: Cover the screen with your palm to turn it off and double-tap it to turn it back on.7-day battery with Instacharge: Use your watch for 7 days straight and juice it for another 24 hours in just 10 minutes of charge.', 'fasttrack-1.jpg', 4000, 3000),
(28, 'SMART WATCHES', 6, 'smart_watches', 'Premium metallic build: A perfect blend of finesse and functionality, with a premium functional crown encased in an elegant metal body. Only the finest for your wear.\r\nHigh-precision AMOLED display: The largest-ever 2.1” AMOLED display. Experience vivid hues and shades with high-definition resolution. Screen clarity like never before, with ultra-thin bezels for a better screen-to-viewing ratio.\r\nTrue Sync enabled BT calling: Connectivity has never been more convenient, with True Sync enabled BT calling. Busy on-the-go, or detoxing offline, never lose touch.\r\nNoiseFit App: Unlock your peak potential with in-depth data summaries and health insights for you to achieve your wellness goals.\r\nProductivity suite: Starting your day off with an alarm, watching out for the clouds with weather updates, and powering through your daily commute with upbeat tunes. The productivity suite makes every day simple, so you can live large.\r\nUp to 7 days of Battery: Power through an entire week on a single charge, performance built to last.\r\nIn-the-box: The contents in the box include a ColorFit Ore smartwatch, a charging cable, a warranty card, a user manual, and a toolkit for the metal strap variant.', 'IMG-20240521-WA0026.jpg', 4000, 2500),
(29, 'DRESS WATCHES', 6, 'dress_watches', '100% PREMIUM QUALITY WATCHES: We Are Providing Classic Watches for Men With 100% Premium Quality Quartz Movement. Our Watches Are Incredibly Durable and Can Last A Lifetime When Properly Maintained\r\nCOMFORT and DURABILITY: When you need a watch to prove that you value your time, LONGBO watches is the answer. Our silicon strap watches not only makes a comfortable sense for your wrist but also easy to match your clothes. Our chronograph wrist watches are perfect for the adventurer or the everyday man who is looking for a stylish match to his outfit. Our passion drives us towards perfection. We put in hours and hours of work to get a truly amazing and unique end product.\r\nPAIR WITH ANY OUTFIT: This Trendy and Classical Design Watch Will Go Great with Any Outfit and On Any Occasion. It Is Suitable for Both Casual and Special Occasions. It Enables You to Easily Spice Up a Normal Outfit and Add Style to Your Life\r\nPERFECT GIFT: Silicon Strap Chronograph Watch is a luxurious fashion gift for graduation, birthday, wedding, and valentine’s day. Chronograph Watch is an ideal gift for father, boyfriend brother, husband or other male classmates and colleagues. It is It is sure to win the heart of your friends and family members.\r\nAFTER SALES SERVICE: Each Product Has a 1-Year Warranty from All Manufacturing Defects. If You Have Any Questions About the Product, Please Contact Us Immediately and We Will Give You A Satisfactory Solution', 'IMG-20240521-WA0027.jpg', 4000, 2000),
(30, 'CHRONOGAPH WATCHES', 6, 'chronogaph_watches', 'Elegant Design: Blue Dial with Gold tone on a Silver Bracelet; recommended to those looking for small dial watches\r\nDial diameter: 41 mm (Small); Case Thickness: 11 mm; Weigh: 132 g; Band Length: 20 cm, strap length can be adjusted and adjustment tool is provided\r\nFunctional Chronograph: Stop Watch, 24-hour display; Imported Quartz movement; 316L Solid Stainless steel Bracelet and Stainless steel Case; Crystal: Hardened Mineral glass with special anti-scratch coating\r\nWater Resistance: 30 meter – resistant to rain and accidental splashes; 1 Year Seller Warranty on manufacturing defects\r\nItem Shape: Round', 'IMG-20240521-WA0028.jpg', 4000, 1500),
(31, 'SQUARE SUN GLASSES', 7, 'square_sun_glasses', 'PREMIUM QUALITY: Crafted with durable five barrel stainless steel hinges and optical-grade materials like Acetate and TR90, our stylish sunglasses are stronger and more flexible than typical plastic frames. With exquisite temples and solid metal hinges, they\'re both comfortable and long lasting.\r\nAFFORDABLE LUXURY: Inspired by the latest trends, WMP sunglasses deliver the quality of designer shades without breaking the bank. From classic frames to modern styles, every single pair is (W)orn and (M)ade with (P)urpose.\r\nTRUSTED PROTECTION: Whether you\'re hiking, driving or just enjoying a day at the beach, our luxury sunglasses help shield your eyes from harmful rays. Featuring polarized lenses, they provide 99.99% UVA and UVB protection.\r\nSATISFACTION GUARANTEE: Don\'t love your UV glasses? Reach out to our support team and we\'ll help make things right. As a small, family-owned business based in Arizona, we\'re able to give you personalized attention for total satisfaction.', 'IMG-20240521-WA0029.jpg', 1000, 450),
(32, ' PILOT SUN GLASSES', 7, 'pilot_sun_glasses', 'The polarized lenses can filter out sunlight reflected glare, and protect your eyes from long-term damage by blocking 100% of harmful UVA and UVB rays.\r\nThese OLIEYE retro square sunglasses are made of ultra-thin metal materials, so the frames are super light but very strong. These weights are only 40 grams(0.09 pounds), so you will feel very comfortable and no pressure on your nose.\r\nThese OLIEYE sunglasses are the perfect choice for outdoor sports and activities such as taking selfies, shopping, driving, traveling, and are suitable as a high fashion accessory and daily wear all year round.\r\nProduct dimensions – height: 46MM(1.81inches)--Lens Width: 50MM(1.97inches)--Frame Length: 130MM(5.12 inches).\r\nAccessories included: glasses case, cleaning cloth, polarized testing card, and gift box packaging', 'IMG-20240521-WA0030.jpg', 1000, 500),
(33, 'SHIELD SUN GLASSES', 7, 'shield_sun_glasses', '🔺HD POLARIZED UV400 PROTECTION: Anti-reflective dark lenses are specially added with polarized coating and provide UV400 protection, reduce glare reflected from roads, bodies of water, snow and other horizontal surfaces, relieve the discomfort of bright light on the eyes\r\n🔺SUNGLASSES FIT OVER GLASSES: These polarized sunglasses are specially designed for those who wear prescription glasses, large frame and wide temples can well wrap your existing glasses, people who wear contact lenses or with normal vision can also wear them alone\r\n🔺UNBREAKABLE THICKENED TAC LENS: 1.1mm thickened lens is 50% thicker than the ordinary lens and comparable to higher-priced professional sports lens. The thicker lens can withstand higher impact from strenuous exercise and avoid damage to eyes and face due to lens fracture\r\n🔺LIGHTWEIGHT & FLEXIBLE TR90 FRAME: The frame of sunglasses is crafted from high-quality memory polymer material TR90 with lightweight, super toughness, collision-resistant and low friction coefficient, it is the most popular ultra-light frame material in the world\r\n🔺MULTI-FUNCTION POLARIZED SUNGLASSES: These classic square sunglasses are perfect for males and females with various face shapes, not only ideal for driving, fishing, playing golf and other outdoor activities, but also a wonderful and practical gift ideal for your friends and family!', 'IMG-20240521-WA0031.jpg', 1000, 750),
(34, ' ROUND SUN GLASSES', 7, 'round_sun_glasses', 'UV400 PROTECTION: LIXX lenses can block 100% of both UVA and UVB radiation. UV400 rated sunglasses is essential to protecting your eyes against long term UV damage and keeping your eyes healthy when you go out.\r\nHIGH QUALITY MATERIALS: LIXX sunglasses is made of high quality material that is durable enough for long time using. They are suitable for any climate and weather conditions.\r\nMULTIPLE SIZE AND LENS COLORS: This round sunglasses have two sizes and at least five colors of lenses to choose from, let you match different wear styles, and choose the appropriate size to make you more comfortable to wear.\r\nPERFECT ALL OCCASIONS: LIXX sunglasses is the perfect choice for outdoor activities such as walking, driving, shopping, travelling, taking photos, and is suitable as high fashion accessory and daily wear all year round.\r\n30 DAYS GUARANTEED: In case any broken problem happens, contact the seller of LIXX without hesitation to solve the problem until satisfaction. You have no risk to try and we will provide you the best service!', 'IMG-20240521-WA0032.jpg', 1000, 800),
(35, ' EAR FRAME SUN GLASSES', 7, 'ear_frame_sun_glasses', 'By absorbing 85% of visible light and blocking out most of the blue light, green lenses provide remarkable color contrast. G-15 green lenses ensure better clarity of vision and a more \"natural vision\".\r\nRB3548N hexagonal flat lenses Polarized sunglasses: These unisex Ray-Ban sunglasses feature a new hexagonal round metal shape with thin coined profiles with super thin temples and flat crystal Polarized lenses. Ray-Ban polarized lenses block 99% of the reflected light, eliminate glare, increase visual clarity, enhance contrast and reduce eye strainShop products that have been wholly produced or have undergone their last substantial transformation in Italy. Discover more about “Made in Italy”, a label synonymous throughout the world with refined materials, attention to detail, and creativity.\r\n', 'IMG-20240521-WA0033.jpg', 1000, 600),
(43, 'White Blazer', 3, 'white_blazer_for_men', 'best quality blazer with white stripe', 'blazer2.jpg', 2400, 2000),
(44, 'JACKET', 3, 'winter_warm_jacket', 'jacket For Men Winter Wear Puffer Jacket For Men Monsoon Winter Wear for men Men Hooded Winter Jackets For Men Padded Bomber Jacket For Men Full Sleeve Mens Jacket Winter Mens jacket Man', 'inkastjacket1.jpg', 3000, 2400),
(45, 'NIKE AIR JORDAN', 4, 'nike_air_jordan', 'best quality shoes for men', 'Air-jordan-2.png', 5200, 4800);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('byiXktLU980KKpRTax815xJLZRIiylUfH1ofeILf', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36 Edg/134.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlcwOGNlOHkzNU9xZW05RnVXWmdGMGdIVWVKNG84YlkzZkpPRzRMMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1743240248),
('CPLDMOhZCCt5R9SB9hojOf9EBMvt9gRauL0HcjnA', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiY05PUFowV2hZY2wxdEw5eDBvMGlJaEdoRXBJM29ISXB3d2I4SVZDciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735365051),
('hLN9gQ0HQkT86amJF3KbjJI1T0U9shffm9UCl5qO', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoibEN3R0k3VmhESXlvdEtySGx5NEhpbnBIc3Z6UTh5VERaTXZRbHZsdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735362301),
('iByotzEvDISz4Qm1FsfqTaMfXoG0SaB8w79I8N7T', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVFZaS3NwTVRmajh4eTFYclRBNHJQNUxhQ2ZmcVdsRUNoS3RIdEVPeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735546737),
('q6HVuZtR3oLM23XAM1AeT3TIUhl9BsUjQtCS6LI9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNHFsZ1Y2WlNDVDlqRVJ3ZTRiZFFzUlVhMGpPM0Noa25VMUNUcjFoRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735805286),
('YM9qAZFrF2LXIAUYihIzSPvxvW8Tz3qPtyympmTn', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidGFkQ0EwOHpVMW8xQmZMdTFBalpKSjJGeEVhcnMyT2h0RXVBOHNDTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC93aG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1735879596),
('z6E3sbNnCTPsYCOkLo4qdeDgYngIY9qmJWhoMMp9', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36 Edg/131.0.0.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieXFrSjJoUzN3UjVFVVFoallINk96Qm91UENFb2pRYTF1YVNFNDhwWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzU6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXRfZGV0YWlscy8xIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1735892525);

-- --------------------------------------------------------

--
-- Table structure for table `shippers`
--

CREATE TABLE `shippers` (
  `shipperID` int(11) NOT NULL,
  `shipperName` varchar(155) NOT NULL,
  `shipperPhone` varchar(15) NOT NULL,
  `shipping_charge` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shippers`
--

INSERT INTO `shippers` (`shipperID`, `shipperName`, `shipperPhone`, `shipping_charge`) VALUES
(1, 'SpeedyShipper', '(503)-1999', 100),
(2, 'DTDCShipping', '(503)-1989', 200),
(3, 'FederalShipping', '(503)-1997', 300);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(222) NOT NULL,
  `pass` varchar(55) NOT NULL,
  `name` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `pass`, `name`) VALUES
(1, 'Vivek123@gmail.com', '12345', 'Vivek'),
(2, 'aarav@123gmail.com', '12345', 'Aarav'),
(3, 'vivekkunwar07@gmail.com', '12345', 'vivek kunwar'),
(4, 'yash123@gmail.com', '12345', 'yash'),
(5, 'karan@gmail.com', '12345', 'Karan Sharma'),
(6, 'deepak123@gmail.com', '12345', 'Deepak');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'vivek', 'vivek@gmail.com', NULL, '12345', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `shippers`
--
ALTER TABLE `shippers`
  ADD PRIMARY KEY (`shipperID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `shippers`
--
ALTER TABLE `shippers`
  MODIFY `shipperID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
