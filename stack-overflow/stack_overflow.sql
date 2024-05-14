-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 13, 2023 at 10:14 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stack_overflow`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `answer`, `user_id`, `question_id`, `created_at`) VALUES
(4, '&lt;p&gt;Hello&lt;/p&gt;', 5, 6, '2023-02-12 21:34:04'),
(5, '&lt;p&gt;Welcome&lt;/p&gt;', 5, 6, '2023-02-12 21:40:59'),
(7, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 21:47:19'),
(9, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 21:49:20'),
(10, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 21:51:11'),
(11, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 21:51:59'),
(12, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 21:55:10'),
(13, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 21:58:24'),
(14, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 22:00:03'),
(15, '&lt;p&gt;anything&lt;/p&gt;', 5, 6, '2023-02-12 22:00:46'),
(16, '&lt;p&gt;KSU&lt;/p&gt;', 5, 7, '2023-02-12 22:02:43'),
(17, '&lt;p&gt;Hello&lt;/p&gt;', 5, 8, '2023-02-12 22:05:21'),
(18, '&lt;p&gt;Hello&lt;/p&gt;', 5, 8, '2023-02-12 22:05:23'),
(21, '&lt;p&gt;KSU&lt;/p&gt;', 5, 15, '2023-02-12 22:09:10'),
(22, '&lt;p&gt;Welcome&lt;/p&gt;', 5, 16, '2023-02-12 22:10:30'),
(23, '&lt;p&gt;Welcome&lt;/p&gt;', 5, 16, '2023-02-12 22:10:33'),
(24, '&lt;p&gt;Welcome&lt;/p&gt;', 5, 16, '2023-02-12 22:10:36'),
(25, '&lt;p&gt;Welcome&lt;/p&gt;', 3, 6, '2023-02-12 22:12:13'),
(28, '&lt;p&gt;The&amp;nbsp;&lt;code&gt;pointer-events&lt;/code&gt;&amp;nbsp;CSS property can be set in&amp;nbsp;&lt;a href=&quot;https://developer.mozilla.org/en-US/docs/Web/CSS/pointer-events#Browser_compatibility&quot; rel=&quot;noreferrer&quot;&gt;modern browsers&lt;/a&gt;&amp;nbsp;on a particular graphic element and tells under what circumstances the element can become the target of pointer events.&lt;/p&gt;\r\n&lt;p&gt;The&amp;nbsp;&lt;code&gt;none&lt;/code&gt;&amp;nbsp;value makes sure that the element is never the target of pointer events and prevents all click, state and cursor options on the element.&lt;/p&gt;', 5, 32, '2023-02-13 22:49:53'),
(29, '&lt;p&gt;If you want the anchor tag to be a link destination, but not a link source then omit the href attribute and only have a name attribute. The HTML 4.01 spec allows this and suggests that browsers display the text within the href-less anchor tag as normal text.&lt;/p&gt;', 5, 32, '2023-02-13 22:50:06'),
(30, '&lt;p&gt;Software engineering&lt;/p&gt;', 8, 36, '2023-02-13 23:00:28'),
(31, '&lt;p&gt;&lt;span style=&quot;font-family: impact, sans-serif;&quot;&gt;Hello&lt;/span&gt;&lt;/p&gt;', 5, 36, '2023-02-13 23:02:36');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `content` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `answer_id`, `question_id`, `created_at`) VALUES
(7, 'Hello', 5, 5, NULL, '2023-02-12 21:45:12'),
(8, 'Welcome', 5, 4, NULL, '2023-02-12 21:45:30'),
(9, 'Welcome', 5, 4, NULL, '2023-02-12 21:46:39'),
(11, 'Hello', 5, 16, NULL, '2023-02-12 22:02:50'),
(12, 'Hello', 5, 16, NULL, '2023-02-12 22:03:57'),
(13, 'Hello', 5, 16, NULL, '2023-02-12 22:04:01'),
(14, 'Hello', 5, 16, NULL, '2023-02-12 22:04:03'),
(15, 'Hello', 5, 16, NULL, '2023-02-12 22:04:05'),
(20, 'Hello', 5, 21, NULL, '2023-02-12 22:09:18'),
(21, 'Welcome', 5, 21, NULL, '2023-02-12 22:09:26'),
(22, 'Welcome', 5, 21, NULL, '2023-02-12 22:09:33'),
(23, 'Hello', 5, 22, NULL, '2023-02-12 22:10:57'),
(24, 'Hello', 5, 22, NULL, '2023-02-12 22:11:04'),
(25, 'Hello', 3, 4, NULL, '2023-02-12 22:12:01'),
(29, 'hello', 6, 22, NULL, '2023-02-13 22:04:48'),
(30, 'hello', 6, 22, NULL, '2023-02-13 22:04:51'),
(31, 'hello', 6, 22, NULL, '2023-02-13 22:07:00'),
(32, 'Remember not to use just a but a:link and a:visited for your real links. The same applies to :hover: use a:link:hover and a:visited:hover instead of just a:hover. ', 5, 28, NULL, '2023-02-13 22:50:40'),
(33, 'Thank you for your helpful answer', 5, 29, NULL, '2023-02-13 22:52:05'),
(34, '👍 ', 3, 28, NULL, '2023-02-13 22:52:42'),
(35, 'I find the question useful', 8, NULL, 36, '2023-02-13 22:59:55'),
(36, 'Welcome', 8, 30, NULL, '2023-02-13 23:00:39'),
(37, 'Welcome', 8, 30, NULL, '2023-02-13 23:01:10');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `title`, `description`, `user_id`, `created_at`) VALUES
(6, 'Java', '&lt;p&gt;Welcome&lt;/p&gt;', 3, '2023-02-12 21:26:02'),
(7, 'HTML', '&lt;p&gt;Hello&lt;/p&gt;', 3, '2023-02-12 21:26:16'),
(8, 'CSS', 'Welcome', 3, '2023-02-12 21:26:25'),
(9, 'PHP', 'Hey', 3, '2023-02-12 21:26:38'),
(10, 'AJAX', 'SWE', 3, '2023-02-12 21:26:50'),
(11, 'JavaScript', '381', 3, '2023-02-12 21:27:01'),
(13, 'KSU', 'Welcome', 3, '2023-02-12 21:27:16'),
(14, 'Python', '&lt;p&gt;Welcome&lt;/p&gt;', 3, '2023-02-12 21:27:47'),
(15, 'C++', 'Welcome', 3, '2023-02-12 21:28:23'),
(16, 'C', '&lt;p&gt;hey&lt;/p&gt;', 3, '2023-02-12 21:28:43'),
(21, 'Software Engineering', '&lt;p&gt;KSU&lt;/p&gt;', 6, '2023-02-12 23:01:55'),
(23, 'How can i use printf in java to to print formatted', '&lt;p&gt;I&#039;m trying to format my output with&amp;nbsp;&lt;em&gt;&lt;code&gt;System.out.printf();&lt;/code&gt;&lt;/em&gt;&amp;nbsp;function in java .&lt;br&gt;the output format is like this :&lt;/p&gt;\r\n&lt;p&gt;In each line of output there should be two columns: The first column contains the String and is left justified using exactly characters. The second column contains the integer, expressed in exactly digits; if the original input has less than three digits, you must pad your output&#039;s leading digits with zeroes.&lt;br&gt;================================&lt;br&gt;java &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 100&lt;br&gt;cpp &amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 065&lt;br&gt;python &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; &amp;nbsp; 050&lt;br&gt;================================&lt;/p&gt;', 5, '2023-02-13 22:35:11'),
(24, 'How can I read numeric strings in Excel cells as s', 'I have excel file with such contents:\r\n\r\nA1: SomeString\r\n\r\nA2: 2\r\n\r\nAll fields are set to String format.\r\n\r\nWhen I read the file in java using POI, it tells that A2 is in numeric cell format.\r\n\r\nThe problem is that the value in A2 can be 2 or 2.0 (and I want to be able to distinguish them) so I can&#039;t just use .toString().\r\nWhat can I do to read the value as string?', 5, '2023-02-13 22:35:27'),
(26, 'Find a table cell, then find corresponding row cel', '&lt;p&gt;Using Selenium/Java, I have a table where I need to find the country Austria, then determine which Company is in that country. I found the xPath (//td[.=&#039;Austria&#039;]) to Austria in the table, but is there a better way to use cells then move two cells to the left to find the Company name (Ernest Handel? Is there a better solution? table is at:&amp;nbsp;&lt;a href=&quot;https://www.w3schools.com/html/html_tables.asp&quot; rel=&quot;nofollow noreferrer&quot;&gt;https://www.w3schools.com/html/html_tables.asp&lt;/a&gt;&lt;/p&gt;', 5, '2023-02-13 22:35:59'),
(27, 'disable next button after 1 swiper', '&lt;pre class=&quot;default s-code-block&quot;&gt;&lt;code class=&quot;hljs language-yaml&quot;&gt;&lt;span class=&quot;hljs-string&quot;&gt;var&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;swiper&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;=&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;new&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;Swiper(&quot;.slide-content&quot;,&lt;/span&gt; {\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;slidesPerView:&lt;/span&gt; &lt;span class=&quot;hljs-number&quot;&gt;3&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;spaceBetween:&lt;/span&gt; &lt;span class=&quot;hljs-number&quot;&gt;25&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;loop:&lt;/span&gt; &lt;span class=&quot;hljs-literal&quot;&gt;true&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;centerSlide:&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;&#039;true&#039;&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;fade:&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;&#039;true&#039;&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;grabCursor:&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;&#039;true&#039;&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;slidesPerGroup:&lt;/span&gt; &lt;span class=&quot;hljs-number&quot;&gt;3&lt;/span&gt;,\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;pagination:&lt;/span&gt; {\r\n    &lt;span class=&quot;hljs-attr&quot;&gt;el:&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;&quot;.swiper-pagination&quot;&lt;/span&gt;,\r\n    &lt;span class=&quot;hljs-attr&quot;&gt;clickable:&lt;/span&gt; &lt;span class=&quot;hljs-literal&quot;&gt;true&lt;/span&gt;,\r\n    &lt;span class=&quot;hljs-attr&quot;&gt;dynamicBullets:&lt;/span&gt; &lt;span class=&quot;hljs-literal&quot;&gt;true&lt;/span&gt;,\r\n  },\r\n  &lt;span class=&quot;hljs-attr&quot;&gt;navigation:&lt;/span&gt; {\r\n    &lt;span class=&quot;hljs-attr&quot;&gt;nextEl:&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;&quot;.swiper-button-next&quot;&lt;/span&gt; ,\r\n    &lt;span class=&quot;hljs-attr&quot;&gt;prevEl:&lt;/span&gt; &lt;span class=&quot;hljs-string&quot;&gt;&quot;.swiper-button-prev&quot;&lt;/span&gt;,\r\n  },\r\n\r\n  &lt;span class=&quot;hljs-string&quot;&gt;breakpoints:&lt;/span&gt;{\r\n      &lt;span class=&quot;hljs-attr&quot;&gt;0:&lt;/span&gt; {\r\n          &lt;span class=&quot;hljs-attr&quot;&gt;slidesPerView:&lt;/span&gt; &lt;span class=&quot;hljs-number&quot;&gt;1&lt;/span&gt;,\r\n      },\r\n      &lt;span class=&quot;hljs-attr&quot;&gt;520:&lt;/span&gt; {\r\n          &lt;span class=&quot;hljs-attr&quot;&gt;slidesPerView:&lt;/span&gt; &lt;span class=&quot;hljs-number&quot;&gt;2&lt;/span&gt;,\r\n      },\r\n      &lt;span class=&quot;hljs-attr&quot;&gt;950:&lt;/span&gt; {\r\n          &lt;span class=&quot;hljs-attr&quot;&gt;slidesPerView:&lt;/span&gt; &lt;span class=&quot;hljs-number&quot;&gt;3&lt;/span&gt;,\r\n      },\r\n  },\r\n}&lt;span class=&quot;hljs-string&quot;&gt;);&lt;/span&gt;&lt;/code&gt;&lt;/pre&gt;', 5, '2023-02-13 22:36:32'),
(29, 'Silhouette with CSS filters SWE', '&lt;pre class=&quot;snippet-code-css lang-css s-code-block&quot;&gt;&lt;code class=&quot;hljs language-css&quot;&gt;&lt;span class=&quot;hljs-selector-tag&quot;&gt;body&lt;/span&gt; {\r\n  &lt;span class=&quot;hljs-attribute&quot;&gt;background&lt;/span&gt;: deeppink;\r\n}\r\n\r\n&lt;span class=&quot;hljs-selector-tag&quot;&gt;img&lt;/span&gt; {\r\n  &lt;span class=&quot;hljs-attribute&quot;&gt;filter&lt;/span&gt;: &lt;span class=&quot;hljs-built_in&quot;&gt;brightness&lt;/span&gt;(&lt;span class=&quot;hljs-number&quot;&gt;0&lt;/span&gt;) &lt;span class=&quot;hljs-built_in&quot;&gt;invert&lt;/span&gt;(&lt;span class=&quot;hljs-number&quot;&gt;1&lt;/span&gt;);\r\n}\r\n\r\n&lt;span class=&quot;hljs-selector-tag&quot;&gt;img&lt;/span&gt;&lt;span class=&quot;hljs-selector-pseudo&quot;&gt;:hover&lt;/span&gt; {\r\n  &lt;span class=&quot;hljs-attribute&quot;&gt;filter&lt;/span&gt;: none;\r\n}&lt;/code&gt;&lt;/pre&gt;', 5, '2023-02-13 22:38:39'),
(30, 'HTML Bootstrap Coding | Cards', '&lt;pre class=&quot;default s-code-block&quot;&gt;&lt;code class=&quot;hljs language-xml&quot;&gt;&lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;&lt;span class=&quot;hljs-name&quot;&gt;div&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;col&quot;&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n    &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;&lt;span class=&quot;hljs-name&quot;&gt;div&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;card&quot;&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n      &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;&lt;span class=&quot;hljs-name&quot;&gt;i&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;fa fa-medkit fa-5x&quot;&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;aria-hidden&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;true&quot;&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;center&quot;&lt;/span&gt;&amp;gt;&lt;/span&gt;&lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;/&lt;span class=&quot;hljs-name&quot;&gt;i&lt;/span&gt;&amp;gt;&lt;/span&gt; \r\n      &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;&lt;span class=&quot;hljs-name&quot;&gt;div&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;card-body&quot;&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n        &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;&lt;span class=&quot;hljs-name&quot;&gt;h5&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;card-title&quot;&lt;/span&gt; &amp;gt;&lt;/span&gt;Allied Health&lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;/&lt;span class=&quot;hljs-name&quot;&gt;h5&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n        &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;&lt;span class=&quot;hljs-name&quot;&gt;p&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;card-text&quot;&lt;/span&gt; &lt;span class=&quot;hljs-attr&quot;&gt;class&lt;/span&gt;=&lt;span class=&quot;hljs-string&quot;&gt;&quot;center&quot;&lt;/span&gt;&amp;gt;&lt;/span&gt;&lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;/&lt;span class=&quot;hljs-name&quot;&gt;p&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n      &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;/&lt;span class=&quot;hljs-name&quot;&gt;div&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n    &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;/&lt;span class=&quot;hljs-name&quot;&gt;div&lt;/span&gt;&amp;gt;&lt;/span&gt;\r\n  &lt;span class=&quot;hljs-tag&quot;&gt;&amp;lt;/&lt;span class=&quot;hljs-name&quot;&gt;div&lt;/span&gt;&amp;gt;&lt;/span&gt;&lt;/code&gt;&lt;/pre&gt;', 5, '2023-02-13 22:39:21'),
(31, 'How to split multiple terminals in a single window', '&lt;p&gt;I&#039;ve a single screen terminal as shown in screenshot&amp;nbsp;&lt;a href=&quot;https://i.stack.imgur.com/hSb99.jpg&quot; rel=&quot;nofollow noreferrer&quot;&gt;single screen terminal&lt;/a&gt;,&lt;/p&gt;\r\n&lt;p&gt;I want to split the terminal screen in multiple part as shown in screenshot&amp;nbsp;&lt;a href=&quot;https://i.stack.imgur.com/DTKC3.jpg&quot; rel=&quot;nofollow noreferrer&quot;&gt;Muti screen terminal view&lt;/a&gt;.&lt;/p&gt;\r\n&lt;p&gt;Note: I&#039;ve also created single terminal using(javascript, html , css and ruby on rails) but how can do to split single terminal into multiple terminals in a single window.&lt;/p&gt;\r\n&lt;p&gt;used javascript-&lt;/p&gt;', 5, '2023-02-13 22:40:07'),
(32, 'How do I make a link unclickable?', '&lt;p&gt;Is there some CSS property or something that I can use with my anchor tag so as to make it unclickable or I HAVE to do stuff in code behind to get what I want?&lt;/p&gt;\r\n&lt;p&gt;&lt;strong&gt;[edit]&lt;/strong&gt;&amp;nbsp;&lt;code&gt;onclick=return false;&lt;/code&gt;&amp;nbsp;is refreshing the page.. I dont want that.. want this anchor tag to appear as a plain text.. actually I have css applied on anchor tag.. so cant change it to simple lable or whatever&lt;/p&gt;', 5, '2023-02-13 22:40:28'),
(33, 'How to render tooltip on hover - but downwards dir', '&lt;p&gt;Sorry for not providing any working code, but right now my tooltip is rendered &quot;above&quot; the mouse pointer when on hover. But I want it to render &#039;below&#039; the mouse pointer.&lt;/p&gt;\r\n&lt;p&gt;Can you suggest what I should look into?&lt;/p&gt;\r\n&lt;p&gt;This is confidential code so cannot share snippets.&lt;/p&gt;', 5, '2023-02-13 22:53:56'),
(34, 'How to get the sidebar to the right side of the sc', '&lt;p&gt;I&#039;m new to css, so don&#039;t mind my skills, I copied this code from somebody else online. What I want to do is, having the sidebar to be at the right and when you hover over it, the details pop out towards the left. I&#039;d appreciate any help that I get.&lt;/p&gt;', 5, '2023-02-13 22:54:34'),
(35, 'My options overlap when i switch to mobile view', '&lt;p&gt;In desktop mode, the formatting is fine but when i switch to mobile mode the options overlap on each other.&amp;nbsp;&lt;a href=&quot;https://i.stack.imgur.com/5TGM7.png&quot; rel=&quot;nofollow noreferrer&quot;&gt;Image&amp;nbsp;&lt;/a&gt;Here is the code:&lt;/p&gt;', 5, '2023-02-13 22:55:52'),
(36, 'JS/CSS/HTML Noob Issue with Running Terminal Sim T', '&lt;p&gt;I attempted to copy in the source code from the website, save the text file in the same directory, didnt even rename it just to try to get it to run locally. When I attempt to run it I get the base formatting to show up in chrome (black screen blinky text cursor) but it seems the text file will not import and run the actual content of the text.&lt;/p&gt;', 5, '2023-02-13 22:56:18'),
(40, 'Beginner learner HTML and CSS', '&lt;p&gt;I&#039;m a beginner in this field so I would like to ask about the best way and resources to learn HTML And CSS for someone like me from the community. thank you for your responses in advance.&lt;/p&gt;\r\n&lt;p&gt;I already have tried some YouTube tutorials but I think my learning process is slow.&lt;/p&gt;', 5, '2023-02-13 23:15:58'),
(41, 'CSS Border inside the container but not at the edg', '&lt;p&gt;I want to create a shape similar to the picture, where the left border is inside the container but not at the edge.&lt;/p&gt;', 5, '2023-02-13 23:16:20'),
(42, 'How do I make a custom WordPress admin menu icon?', '&lt;p&gt;I&#039;m working on a wordpress plugin and I&#039;d like to put a custom icon in the main wordpress admin menu.&lt;/p&gt;\r\n&lt;p&gt;I&#039;ve seen other plugins do this, the icons are grey. When you mouse over the item in the menu, the text and icon turn blue. If you are on that plugin&#039;s page, the text and icon are white.&lt;/p&gt;', 5, '2023-02-13 23:16:45'),
(43, 'Create Custom Social Share Buttons in angular', '&lt;p&gt;I have an angular project and I try to create icons share buttons for social media. I have a component named landing.component. in the HTML file I implemented a Modal popup to allow showing a new windows where I have the icons. Please, follow screenshots below&lt;/p&gt;', 5, '2023-02-13 23:17:44'),
(44, 'Why am I getting truncation?', '&lt;p&gt;My problem is the following. I want to make multiple squares visible when scrolling inside a square, but when I apply overflow: scroll; as shown below, the top row of squares is cut off and the spacing is gone. How should I modify the code?&lt;/p&gt;', 5, '2023-02-13 23:18:29'),
(45, 'Q1', '', 7, '2023-02-13 23:23:55'),
(46, 'Q2', '', 7, '2023-02-13 23:23:58'),
(47, 'Q3', '', 7, '2023-02-13 23:24:02'),
(48, 'Q4', '', 7, '2023-02-13 23:24:05'),
(49, 'Q5', '', 7, '2023-02-13 23:24:11'),
(50, 'Q6', '', 7, '2023-02-13 23:24:21'),
(51, 'Q7', '', 7, '2023-02-13 23:24:24'),
(52, 'Q8', '', 7, '2023-02-13 23:24:27'),
(53, 'Q9', '', 7, '2023-02-13 23:24:30'),
(54, 'Q10', '', 7, '2023-02-13 23:24:34'),
(55, 'Q11', '', 7, '2023-02-13 23:24:38'),
(56, 'Q12', '', 7, '2023-02-13 23:24:42'),
(57, 'Q13', '', 7, '2023-02-13 23:24:44'),
(58, 'Q14', '', 7, '2023-02-13 23:24:47'),
(59, 'Q15', '', 7, '2023-02-13 23:24:51'),
(60, 'Q16', '', 7, '2023-02-13 23:24:55'),
(61, 'Q17', '', 7, '2023-02-13 23:25:05'),
(62, 'Q18', '', 7, '2023-02-13 23:25:08'),
(63, 'Q19', '', 7, '2023-02-13 23:25:12'),
(64, 'Q20', '', 7, '2023-02-13 23:25:15'),
(65, 'Q21', '', 7, '2023-02-13 23:25:18'),
(66, 'Q22', '', 7, '2023-02-13 23:25:23'),
(67, 'Q23', '', 7, '2023-02-13 23:25:26'),
(68, 'Q24', '', 7, '2023-02-13 23:25:30'),
(69, 'Q25', '', 7, '2023-02-13 23:25:33'),
(70, 'Q26', '', 7, '2023-02-13 23:25:36'),
(71, 'Q27', '', 7, '2023-02-13 23:25:41'),
(72, 'Q28', '', 7, '2023-02-13 23:25:45'),
(73, 'Q29', '', 7, '2023-02-13 23:25:48'),
(74, 'Q30', '', 7, '2023-02-13 23:25:52'),
(75, 'Q31', '', 7, '2023-02-13 23:25:54'),
(76, 'CSS', '&lt;p&gt;Welcome&lt;/p&gt;', 5, '2023-02-13 23:56:22'),
(77, 'HTML', '&lt;p&gt;hello&lt;/p&gt;', 5, '2023-02-13 23:58:16'),
(78, 'HTML', '&lt;p&gt;hello&lt;/p&gt;', 5, '2023-02-14 00:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `rate`, `answer_id`, `user_id`) VALUES
(3, 2, 4, 5),
(4, 2, 4, 5),
(5, 2, 4, 5),
(6, 2, 4, 5),
(7, 3, 5, 5),
(10, 3, 16, 5),
(11, 3, 21, 5),
(12, 5, 4, 3),
(13, 3, 5, 3),
(15, 2, 7, 3),
(21, 5, 22, 3),
(22, 1, 23, 3),
(23, 1, 16, 3),
(24, 1, 16, 3),
(25, 1, 16, 3),
(26, 4, 28, 5),
(27, 3, 29, 5),
(28, 5, 28, 3),
(29, 2, 29, 3),
(30, 3, 30, 8),
(31, 5, 30, 5),
(32, 1, 31, 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`) VALUES
(3, 'WEB', 'nbhme00@gmail.com', 'cb08ca4a7bb5f9683c19133a84872ca7'),
(5, 'admin', 'admin@gmail.com', '21232f297a57a5a743894a0e4a801fc3'),
(6, 'Abdulrahman', 'alomrani.a.n@gmail.com', '098890dde069e9abad63f19a0d9e1f32'),
(7, 'Abdulaziz', 'aziz@gmail.com', '098890dde069e9abad63f19a0d9e1f32'),
(8, 'Abdulelah', 'allohee@gmail.com', '35c1fb1ad8c411b5ce1b62acba79a53b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ratings`
--
ALTER TABLE `ratings`
  ADD CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`answer_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
