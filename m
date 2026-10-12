Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013077.outbound.protection.outlook.com [52.103.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57819395266
	for <linux-man@vger.kernel.org>; Mon, 12 Oct 2026 21:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839328; cv=fail; b=bzz6oI9brrNkFdI8y9nrM92sAzB9GC2AkA97iGT99MQ4ozw5bnP+070Ru/qS9cX007+NRHi1zCqS+K+k4xNWKoX4zwOrtFY0XNC2+AmqZjsCOfcEt7/Gx8smOfXAmiYZ3tVeMwCjpKYBdQC6YVCYJb4myLhySKHl1/bCWJAxbss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839328; c=relaxed/simple;
	bh=aoDGizhL3DA/Obaj6mP6EvmjSxOaV4+5Z+GAun3CfVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wb+//RqV4ucpwVxSI5jCmyv+SPkVxKSE8Bhb/rIUQSZhtmEbmomj+OmUijdpraw4rRzJqTIuqMpYzYk0wc5DYQyNjxe+2raCHPDeZi39UQzAGYoxpbe0Us8H4hBR6+h5XB4xX+6NG9E9oMZ3qpQ1yv9/26WSfAKDfzVPd4mljZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=AzknooHV; arc=fail smtp.client-ip=52.103.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="AzknooHV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rBjWlwLLMkXwcGx5Fuh9EiF+NU3bnqsHHurawY2MA26NV1YG0g239cU+L72fwGaCnLSXtwGL/1tcLCybaZkBJJntyDBa+Ih8YmYxHl56k6PL04WBrF2aMszlJDVHxP7zZMjrIikCMdBcf6bpQ432neKIoYni0COG7pMs3vO/29cwvsYH191nkTz+dlenJSfEEVtRjFjnaU2JKZ9TYTMh0TXfc6HggM+cpNOYIJ4jYuwKMrDbweEk5ae4l56TquOm7GTIn8lwp+4g3GUA48vHwXiSHXDNdt3HTNTomm2LD+qyC1m4XP8qL/zCAjJl4OAF9+vaHKG2HHH15GJJwqBjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSYCFLnvV3QK51cq5a/jEog9/b42khEKp2zWuQtzbM8=;
 b=WvzeQ04oeTlj2f9xh58rfFrcAbUK/Hy5trxDWdWor1yHf+2OQJb7zW5zKHQFfKAjgLhHZbFxLLS7x2BmnJVLkDzfVJ5wOSqqQd8xaSAwHCar3I3Z8GuMXjOyS0UAAnER2PveDSU/Wi3aQDgzh36PyvrtPthaKsUKLRyjURMPwlzAw3ir7LGaSukrytHT/Fn2YAnpBc4XVWHqw0goGg63eo85+g1hq2M2mqw3aXnPymKqHRi3Jei/TlbzKH5Mcsr9zwcAoO258OWNY+YCt3z5x9mHz7dXSG/HXjvXYilVojeCMsF5rclWtivGdo+uoxlQLZiBs6RgKbP9EI16fIC3iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSYCFLnvV3QK51cq5a/jEog9/b42khEKp2zWuQtzbM8=;
 b=AzknooHV9/tmASNutbwxIL8EwLI+nSML4PnLdZ09eGu1b5mAtV/vNicCkzT5np0v0Qnz5j7GghdO1sIUb3dL5nPdOVelcC/XedD88cZeRtqDiFBW5uhQ3Aug82Ai7G+bPY5k8SeUNTpZ7hjI1Iv2+oa6dFQIbu8UM2wedi3+hGtVrnyzvSRjoKIWWQ5WH03R6EGcpcknZSnBYPOkugOUB0oaMI4gjAIAzQNd42QERguUFqhPKOtmOgSCpTiGC9IpNA0lDbQOv1XSdYXD32kBhQ/5zltKC0hLAET9j+tn0bfgt0pMyUv3HOrDzBD2sicc9tf6Vgj7PB58VYm/8KPGww==
Received: from AS2PR02MB9737.eurprd02.prod.outlook.com (2603:10a6:20b:60f::14)
 by DU0PR02MB9799.eurprd02.prod.outlook.com (2603:10a6:10:44c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 21:08:40 +0000
Received: from AS2PR02MB9737.eurprd02.prod.outlook.com
 ([fe80::be12:e30c:d91a:f161]) by AS2PR02MB9737.eurprd02.prod.outlook.com
 ([fe80::be12:e30c:d91a:f161%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 21:08:40 +0000
From: Yannick Le Pennec <yannick.lepennec@live.fr>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Yannick Le Pennec <yannick.lepennec@live.fr>
Subject: [PATCH v1 3/3] man/man2/fcntl.2: Add section
Date: Mon, 12 Oct 2026 23:08:16 +0200
Message-ID:
 <AS2PR02MB97374BDC938ACE0D9CFA5A529B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
References: <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0288.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::14) To AS2PR02MB9737.eurprd02.prod.outlook.com
 (2603:10a6:20b:60f::14)
X-Microsoft-Original-Message-ID:
 <20261012210816.2575185-4-yannick.lepennec@live.fr>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB9737:EE_|DU0PR02MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 709639fc-8ff4-400c-20cd-08df28a4fd3f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|15080799012|23021999003|41001999006|260925184616899003|25010399006|5072599009|51005399006|55001999006|24021099003|2607281247196008|440099028|3412199025|40105399003|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q/nuZS71mCzOIERXRZvgMWLv2sMLY0/PKuwVvkkdRFOBUFQBEnBrJn+uJUTX?=
 =?us-ascii?Q?cQ3tk5eLobbUTt5wLK/icI/T3ynSj4tnstiiZSFCs5R+5FSfwtKicBvb7Ont?=
 =?us-ascii?Q?KD2kEpCBzOH4EFOQANm2HUqe49rbUbg+nEGf+6sJJ2vomZEf+vQafqkp05Us?=
 =?us-ascii?Q?fvw6GJv0GV7XsvpSZ8PTX/V0MdletJenlDNWhL/OZj5XthbnwmZj/waD0Pms?=
 =?us-ascii?Q?W8i8fhKv1rf2r103vCFfpLjKglH5nElv21jgyPgd8QtZN0BQZtXM5DQgK84r?=
 =?us-ascii?Q?pyg4MYdWfhvPUN3b7WdPVDVAuL2RnwwVkZwr15iOg5VfTY74UwuTf0VWmMCE?=
 =?us-ascii?Q?fYYugKWrsnUTScZExw2BOiCivWzGov4aMC3efc0p6nRi6Ff24ufsB87LYbsW?=
 =?us-ascii?Q?hyoL1y5tz9Q3D3B1R/tiOReOTWT8+3f0BsmNvgLp/smteEcn7SLnFE3WPj9q?=
 =?us-ascii?Q?t9Ht4OLnliWPDo/FPVVtK/bdNvGXbupSus302OvBVUDC4KClYg6KPMNv1o1i?=
 =?us-ascii?Q?Y1lSXRHUzBeFwIG4oPQC9XCtojX654udTkKx//5U6dl2jzER727TVPs6j6ce?=
 =?us-ascii?Q?xNO7klXiTIyKmNbQX/vg8yMtJqBEytCzZW4sAZ2kZNV0ieOXGnnQ0bg1oz4Y?=
 =?us-ascii?Q?JUqna4FaeSVgqxG2Zmk+bV73tE5jKvEfHMX8Nr3XIxBBqCETcpCOmJ+FiXl1?=
 =?us-ascii?Q?T9jjLvAmILfle3j3KG3cUM99IP7GxklnJuLxDNeNUcUZuA0geeT/I092jkz4?=
 =?us-ascii?Q?QvRxOG4ceIvOZ94bBs3z7O/R0hQmwJkaR77hlUlK2Cz5JYsXWY6Prx6p/OQT?=
 =?us-ascii?Q?MehUpLA2ETZeqY/PDxYcVISn9Emar55PEQ0DF/ABv/UwPazmg/GTDt6IGEu2?=
 =?us-ascii?Q?LunbrWak/0ZESAVe6pFlmBpT1qHCm2fAMFsQo49/tGNdlve2jc1WUSdnrK1E?=
 =?us-ascii?Q?/OkQylXQX7oEL0mDyGtFK0OaqFRwBNzATqN3w4E6+8IlsjGIbs+c07cCWXMa?=
 =?us-ascii?Q?mGGvu4bNqaMMiMnnRrOM71b7XA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?YuItympFxxDawB3Ykyv15+3OX/1EK7SLkcm3Tk/t3EgRHm+curgAl9Bx+oxg?=
 =?us-ascii?Q?7lqgZLzzSeMg3BsBAlH9w1FqVtB+ZYVGAuBfs4wAeOudvUWyv1nvZKE7BVL3?=
 =?us-ascii?Q?3ZiH4UoizGzlDHtHTq4QrOUW87xgRUvpvLdP1Dm7mj5B7B8acFrwWLBPA3lA?=
 =?us-ascii?Q?sft+ZGtNTj+6OdcLWXqcPn3yM9nrvITwBIl2PeWozxfJ+x1+LHa/7XB0pS16?=
 =?us-ascii?Q?ErYT1ohr0odHkRYxgYHLobHE1j6KM+SvSLSw3TRTZlpumL5jHgsRVB1DRzH6?=
 =?us-ascii?Q?w1v22MsnxtkIR9IACubdLAFd09L9a5qdHo5bCWV7POYB3s4modv3SlnmRLww?=
 =?us-ascii?Q?pJAy5s2JWKeBE16Rwb1kDzSfl1PcBUBxA22ySyAvmLLeCrApvpbq3R0E1A/+?=
 =?us-ascii?Q?sJ0VXDrbwzuhExc77azXn9vJZr2VK7rkCZUZIB7ui6L0S47MwlNDvnbALXvb?=
 =?us-ascii?Q?gbVQMnQGh6pBq4wN4av61+Ig28PgG4n3eJeyX2cOfbXvKv3O3hUQIO76kUQl?=
 =?us-ascii?Q?mppM4Z38PxyLwpMlFCel07CYTe/Zt09whFgFgBYhvlUTEm8OkCRW+d7KfWUo?=
 =?us-ascii?Q?4kW/PJCkrTU1Mx6Cr6je6iEdzHyoCAHeyTOG9cQ28qp0JJXgUZa33eKjZgL7?=
 =?us-ascii?Q?grtdFIE+PQmVMVyHwPpYN5/EAHY8c3EW6gixvuai0ZxTkGDe24w8Kyf1808R?=
 =?us-ascii?Q?ndRB2rhU/IQ8gYCeHUN1SksJUfWJlJ3W+1WWJt1ZTjn1HE5CbxN80MI/+h3y?=
 =?us-ascii?Q?y70VsF4xd6LPeEefx6FomIkmqIIKujaPoC3qjF1Yl/jn6mpVyp1DD5vHG6+a?=
 =?us-ascii?Q?WLQXwLLi5KrwsSyHUB4x4xigfGOfOg02p/zHY1ohtHjqAvnlMBPitXdc1klw?=
 =?us-ascii?Q?woQAE1qbx1rAh3Pc4htF+2NM/jKDBLl3EIg3fXaaveFDU+kxbftncA17fVd2?=
 =?us-ascii?Q?+FWtF3mGoM55MaS99EBJp5YRfNzjvtANwEpwKlItNFqMQl+cifS2FJJW8+Zc?=
 =?us-ascii?Q?QvaV/D1mcit0GlopRDM79aBpIvg/YlGctGG1TYL4avdLuJnLktU5VCXPOADJ?=
 =?us-ascii?Q?b3n7zihz1OI97c6TwpSGKCeymDETWWuC8fvTXHEiYdGNRohLyGuorZBqXVmT?=
 =?us-ascii?Q?owwVOWuuZWkvScn72kzK4FsAsjWFWXsI8vayaI73XDt6UBCeKjA+xEuZV0ii?=
 =?us-ascii?Q?w/4bLj+Gf57Gz09NIDiv4H9cnbpwZhqMwgWgwfdYKIEQ7GHwLAYNUVqvTGks?=
 =?us-ascii?Q?0aBr4on8EXYs40+n8JjJtoZJ/ga+w2SCHIiuKiGiKa40cTZBReUwrmtEh/Qf?=
 =?us-ascii?Q?BvomMcCsoltTQK7oNQZjU/hCBIa50g8y36foTGSVVDMidvGurEC63oIp8Lu7?=
 =?us-ascii?Q?UyWitqagBCBDc8y7DQi48JWpvqusqgWrjtSwwHJwEry/NQ1OLnG7f1QTnwrX?=
 =?us-ascii?Q?NE9YX5SS4zX09/7F4YrB+9GTvAl6c+2Wof7XFHikoJDnlSMX2r4tww=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-9f624.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 709639fc-8ff4-400c-20cd-08df28a4fd3f
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB9737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 21:08:40.1265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9799

Add a new fcntl.2 section, 'Open file description queries', listing
F_DUPFD_QUERY and F_CREATED_QUERY.

Signed-off-by: Yannick Le Pennec <yannick.lepennec@live.fr>
---
 man/man2/fcntl.2 | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/man/man2/fcntl.2 b/man/man2/fcntl.2
index 446411a06e..521a4ddd09 100644
--- a/man/man2/fcntl.2
+++ b/man/man2/fcntl.2
@@ -112,6 +112,11 @@ indicating that the kernel does not recognize this value.
 .BR F_GET_FILE_RW_HINT (2const)
 .TQ
 .BR F_SET_FILE_RW_HINT (2const)
+.SS Open file description queries
+.TP
+.BR F_DUPFD_QUERY (2const)
+.TQ
+.BR F_CREATED_QUERY (2const)
 .SH RETURN VALUE
 For a successful call, the return value depends on the operation.
 .P
-- 
2.55.0

