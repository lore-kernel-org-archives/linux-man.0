Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazolkn19013077.outbound.protection.outlook.com [52.103.51.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2F64CB8B5
	for <linux-man@vger.kernel.org>; Mon, 12 Oct 2026 21:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.51.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839323; cv=fail; b=bEGLa6SQVOuBfw6x2iWem2e/44ntcXHdySN1NuafkWPn5CQptqTPzvIVU3o3TzSqfzcv/gJojYZaaVKG64KdDm74orkNmNwQcWkBVenFyIBey5bUtlLm6kDC+1S7p38qzSj/dUHSmddfGBuAN0RUH5axAWz7d0z7d04uC0lFdaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839323; c=relaxed/simple;
	bh=Af3z6g0QTO31DxjkIDyCVdsBso5g1c8BglT22AqoD10=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=G6r+eGNfUkFb/z9hZC/MFmvemW5KljHSQvvuKMm72CBjJNc+eMvnwg2X24q2iRqmYpFz3CO/c7vWpQlfON2lifv1pAFNmwZul0Ip4//xNOvGV2FbnqydIAK1rRvRRJQ8RneINy5WSjWQMWQpOIxfb9+PDxSF0AKRg9lFpLeFz8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr; spf=pass smtp.mailfrom=live.fr; dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b=JBNMyXhR; arc=fail smtp.client-ip=52.103.51.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=live.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=live.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=LIVE.FR header.i=@LIVE.FR header.b="JBNMyXhR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wrjjx8/L+2IdtCRf2LybKpJVx5GJYz3Jeb1mF2Xl+nJtXc5uSEfk6w7LlgL35cXWm4RbP28NJQsj0+cEN411u2AO7wgYvPORxbucwjLzTuBb8QFFABShZNEnuuwi0oAuta76gSQkw5Q1EC8nWDLYbTa8pFZRLm1oDBLaD6tZDyZ+GnVy31EilORLjxzTvV36DTZuLgxWjuLiJ0af+RO0JbgFH1jOT5CuqtdvfiBZ+qisJ78jAA2M0aFcutdxyq5i7yhrgL7p7e2X5iRG7XI8xdi451W34NL4fRHRnr2XtyUcqRGWbIZhD8nyh5CX1EYAEhWeftU8I3sNKOujeYDJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ya2qeP6tNYTuqx0q/oFLo6G/WWJ7tUgv0cp56N5nZ0I=;
 b=XKoi9jHJ9opE4ecIYsJpmluicby4aROy44uPchDDQcj4S/ATY8jHQi6Sb/ZSuXype/synChKa0qkGb06fVFYZJ0gmQ+jScrtUV4mVjQWqjpUbPJCCaXqDzCRzVQcnvjIn5Ps/5EqkZrztdLeYMdKKeRFK5swLuCg1yN9nX748URTF1XH/Fj9J7zy11FsXi1lnlI08Ve6azrXoJQc3Q2NUfopwOh90TZEiDft7knTi6TYfxMOlAnBZSnErweEuZ+x8Jk1QhymFZT+lyP66rn5wKhDncOFpQUdA5V8+LThSsCC4KGoqSzHv8MIE1xhs62yrxdhOUnOSIvpJb8Ik5jbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=LIVE.FR; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ya2qeP6tNYTuqx0q/oFLo6G/WWJ7tUgv0cp56N5nZ0I=;
 b=JBNMyXhRFgK0c55Z2Lak+f1VINlBQKEaWbGoawfs3q60iTBau0bkusbAQ3vkSQGVGLHnzrXGxJrLklGCLXzOnMq0nPGgrrNZqx8EpCPMzf8BYPwbFfzN6Gms1gJdmemz4E278jvTZjFQvqmdEf114Y/FSV2wT+MdRQY1Jy4NrMB1RCgx8QxaN+9eglNgL9hrMIfEYi9e9pfBiDkV2ToecCnilo+Wuvth+n6t1k+AYcxv+axIfkevcd7Znf0wmZQpvLDNgjXK86rwKAm5ACSZ0pAWbBTfjRFDnV1hczRlL/0ApdRVEzpou/qv6xPepB6ZBqhgU1F4VGbtATz20zanWw==
Received: from AS2PR02MB9737.eurprd02.prod.outlook.com (2603:10a6:20b:60f::14)
 by DU0PR02MB9799.eurprd02.prod.outlook.com (2603:10a6:10:44c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 21:08:38 +0000
Received: from AS2PR02MB9737.eurprd02.prod.outlook.com
 ([fe80::be12:e30c:d91a:f161]) by AS2PR02MB9737.eurprd02.prod.outlook.com
 ([fe80::be12:e30c:d91a:f161%6]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 21:08:38 +0000
From: Yannick Le Pennec <yannick.lepennec@live.fr>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Yannick Le Pennec <yannick.lepennec@live.fr>
Subject: [PATCH v1 0/3] man/man2const: Document fcntls F_DUPFD_QUERY, F_CREATED_QUERY
Date: Mon, 12 Oct 2026 23:08:13 +0200
Message-ID:
 <AS2PR02MB973752AF8D9D44AE6CB2DB629B9F2@AS2PR02MB9737.eurprd02.prod.outlook.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0288.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:370::14) To AS2PR02MB9737.eurprd02.prod.outlook.com
 (2603:10a6:20b:60f::14)
X-Microsoft-Original-Message-ID:
 <20261012210816.2575185-1-yannick.lepennec@live.fr>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR02MB9737:EE_|DU0PR02MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 39fb7a58-5c37-453d-cd04-08df28a4fc62
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|19110799012|15080799012|5062599005|23021999003|260925184616899003|25010399006|4140399003|5072599009|16041099003|55001999006|24021099003|2607281247196008|440099028|3412199025|4302099013|10035399007|53005399003|40105399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?72iYSrxvaBB4TbUfsYIOTUpHNFYkMK0uV800qQuck/21n8OOdWepTpPm3uCT?=
 =?us-ascii?Q?nBDsTQVkq0mp/FwU4wjFVWYtKBg8KSniQAzcMW8s5LV3dc+nEY+ZMOlwJlB8?=
 =?us-ascii?Q?XsL1KzBzBxJmoza2rKchlDkfWRzNXIzPJU9jWbACfM+oOpd0tQY3Z6HHxaNR?=
 =?us-ascii?Q?/A+v/IzqevpWW2Bke1ZK25OwGKCVa9B7Bui+/g1WBca+y3dPBiOODqArHvVn?=
 =?us-ascii?Q?rLSjb+OnrDCn6CfAbuFvdX7F3WotpjFEnBBbnHgJk8DcCFAnDrhLYMZfS54T?=
 =?us-ascii?Q?3JOsSt5dzm8ejJoRy6k6o2sg8kx4jmVm3k+B7p6QqbP0Nre6yoriLHMRJYkm?=
 =?us-ascii?Q?gzJxY6WXP/TlD4/XwTCrcJV2wORWzLxLARRJNpwpcSssxZdir5NYz5i++uo4?=
 =?us-ascii?Q?mk2E+pLn4Gfz6s1lAfTuLLZciPW3kzqEGikPG1VuO343klTs7mOPwCQXJPr9?=
 =?us-ascii?Q?buSiG+uDaqeTZTFw6si4yfZ6NK1W7CSmk/WLe2SZXKwjkF+H0fL7pvhB6rgE?=
 =?us-ascii?Q?Ld7deKXJkvYUu8cwXU+a+EJBh88INCfbL/KA6X6dtHg0hdy2CXzOApLPvFCh?=
 =?us-ascii?Q?SYc438rC6HhKns5l5m8dnYeL6oq10OTQ3WaZfsmOtOd7Z/byFVSKe5PmK8lV?=
 =?us-ascii?Q?KDcUhVosbW16KsX3RjCu8R9sAro88CbdQzx/M1ZJfSwFrvdj8SpYVCY2h/7/?=
 =?us-ascii?Q?INFMPsBp/6bcl8MqsCel55SeSSCGauDfiCjXTucFTrcLBwVgda4ygWGFSYAk?=
 =?us-ascii?Q?mfUM5ktGnbr4+71FugJEJX5QCef8LqPFZgaQG1GrmJtiniHP8s0nOltw49Gw?=
 =?us-ascii?Q?wWvM67LZc0u8mG6tiN/uwwPwCNiP2UE9APV4mPqPmcpr58+aJCml5DqV2J8V?=
 =?us-ascii?Q?+GPQhDOEQu+zN7wWR+Q2eGexllIVK1nxjm4vWoGq3uFXE2F2DugafAcjk7ZA?=
 =?us-ascii?Q?myw91KuvbhBzyTCq+hbSn3BjG94Qioh6LRbsk6AjgX/WQJuglsoFQ7ftO1HI?=
 =?us-ascii?Q?k0Ik2mo4leB9wFU4z+spdU4HI92J3WW6oHtSMe4Ek335cScgo34GVOwl0e7w?=
 =?us-ascii?Q?958b1F9uuh1crinhpvxedUZt0hDdUHG/+QdUUORyrOG7WqwpOGo=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?73tYPeQEi9Cs+3Ttl4lMe4ncF5xurNsPVUNFJiF0wM7qaieG5fPhLtgpcY+j?=
 =?us-ascii?Q?535kvaA8PHggXMvQkIEK4sK4vOj+uhCgBSt20Fl2b9yJvvSx7pA2kSjASq/N?=
 =?us-ascii?Q?rRBa0nIhmY6ONaiHof2vsG0enGNm+qKq1bpqMVoO3szXveQ1z5a3WcghGEVz?=
 =?us-ascii?Q?8eOSswE1j/l1AqwtVNgguVq/t0LSaVTxiDFeKDHP9cT7r5kUgWm5ycGNoKbA?=
 =?us-ascii?Q?jFd5Fyo0MlBdvWxJp3Xc/6R4S9N9NHM2aGcCJrIYKVd1HbEvHUfzuw2LqYaR?=
 =?us-ascii?Q?dNkefRz6U0ylGEozyMKNGxo8Cs3s9VqG4HUKC1lW0Y+v6zeC3kWLPb5rmSDs?=
 =?us-ascii?Q?XOAcOO318d9RBrTP0kciEs+FIzPm8efQ/5jZe7eJvysL1907hYbkxJ68loNo?=
 =?us-ascii?Q?44pJfgd6MOq3dEapHSOY2O2oBZwu35M1+sAItjs+hKYLo+4XNGpMM/V7cL95?=
 =?us-ascii?Q?HmZT/Kv2nGnJQrnhBOmC3mRhMoOXALSductG6GUku1H3cPY4JTVvkTsJIcSN?=
 =?us-ascii?Q?Bt8TnWnfobSgAxuat73QabSby+5ZD1JsFVX4CykNPOX0BGWlobVpNDAVBaFX?=
 =?us-ascii?Q?56KwPsI7ztFUvOkQS9VoiF5nuRCV6ms6/VfczFlIAVORE/lJnzj/BVDEYfZi?=
 =?us-ascii?Q?0JBKztkIrdAYhSygsnN3ElyvE+ByeWtHm4B/Diqe10buI0vqtVwEHAYtfN80?=
 =?us-ascii?Q?et/0zQ0QGwPua4mZKEYKN4a6gPah1cg5ffIn2u8fi7Qk6HHrYsEHbSjRE394?=
 =?us-ascii?Q?Z3RCNwwDmcGAnMfjL7MI/v/CYVREMSWZtGg6pAsSpeemtttcWj/VUVeP/Yle?=
 =?us-ascii?Q?lQe798nDt+JnPPEo/9RDwK0uabWo8DCjPGcky0s1jp8DvjpXwAJpou8PTQ2I?=
 =?us-ascii?Q?b/X3p0rPliyYwuU32DztClrNzw4ZHsHv/BcAiFHIMBF6NVw7ZhxwWJ1bacHg?=
 =?us-ascii?Q?BwfVEEZ5MqNsIikAPlaFlG8ZmreJQ8zGgpnPrqOl0GMOZ8WBhU9UBJxRq7NZ?=
 =?us-ascii?Q?xah0B6K8KJzhrPXDgh9/iw89uz5oQ3trN6yXOtW8ui92zUQxlUWWLcJYM4YM?=
 =?us-ascii?Q?zZJr3jrFDZ79Z2i91rlpUAqnB3T9LXjhzXmRQ5h4q+pcJwzmEee+UE8VeWIC?=
 =?us-ascii?Q?UUUv9HnzEErC3OtQdM9ydMkPEnmG29EhIk58Xq8esfjXLkDZxzRh9UmBaKsu?=
 =?us-ascii?Q?9sV2SkZJxaeY3LqnBI+Ma+7ImfgYE/cxkXiiNSpQWxivo8i9IdEJKFcrFA7v?=
 =?us-ascii?Q?A5xpZ06/SoO7HfiZXOFgsc0nhGl8tgfPiTFVsx/1ImGwQUiPotVyC5I8sen9?=
 =?us-ascii?Q?3nEQjtT4lC54FumeLWn9L+GuX/c7m19UAIKMaQlAlEcAGvzTaI3OXXM0HqG2?=
 =?us-ascii?Q?ltuhi02AulW1YMEwYwNJ0spLBVo8Qq4Ny7vOsxURXdZC9BYROv5TrY6jTyDv?=
 =?us-ascii?Q?zqrQnmvferst0oUb3123TDz98Csak9YPbsDc9WZQnC2lKwLmn2zh3g=3D=3D?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-9f624.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 39fb7a58-5c37-453d-cd04-08df28a4fc62
X-MS-Exchange-CrossTenant-AuthSource: AS2PR02MB9737.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 21:08:38.6355
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9799

Linux 6.10 and 6.12 added two new fcntl(2) operations, respectively:

  F_DUPFD_QUERY
    since linux 6.10  c62b758bae6a ("fcntl: add F_DUPFD_QUERY fcntl()")
    since glibc 2.41  28f8cee64a32 ("Add F_DUPFD_QUERY from Linux 6.10 to
                                    bits/fcntl-linux.h")
    Checks whether two fds point to the same open file description.

  F_CREATED_QUERY
    since linux 6.12  820a185896b7 ("fcntl: add F_CREATED_QUERY")
    since glibc 2.41  322e9d4e4430 ("Add F_CREATED_QUERY from Linux 6.12 to
                                    bits/fcntl-linux.h")
    Checks whether a file was created by a call to open(2) with O_CREAT.

This patch series documents both operations individually, with usage examples,
then adds a new category in fcntl.2 that references them.
I hesitated somewhat on whether F_DUPFD_QUERY should belong in the
'Duplicating a file descriptor' section of fcntl.2, or whether it should go with
F_CREATED_QUERY in a separate 'Open file description queries' section, this
series proposes the latter.

Link: <https://lore.kernel.org/dri-devel/CAHk-=wixO-fmQYgbGic-BQVUd9RQhwGsF4bGk8ufWDKnRS1v_A@mail.gmail.com/>
Link: <https://lore.kernel.org/all/20240724-work-fcntl-v1-1-e8153a2f1991@kernel.org/>
Link: <https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=28f8cee64a3223636d15c78f69432503d8ef1c22>
Link: <https://sourceware.org/git/gitweb.cgi?p=glibc.git;h=322e9d4e443084336ea41a8e7bf72456ab273b73>

Yannick Le Pennec (3):
  man/man2const/F_DUPFD_QUERY.2const: Add page
  man/man2const/F_CREATED_QUERY.2const: Add page
  man/man2/fcntl.2: Add section

 man/man2/fcntl.2                     |   5 ++
 man/man2const/F_CREATED_QUERY.2const | 107 +++++++++++++++++++++++++++
 man/man2const/F_DUPFD_QUERY.2const   | 105 ++++++++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 man/man2const/F_CREATED_QUERY.2const
 create mode 100644 man/man2const/F_DUPFD_QUERY.2const

Range-diff against v0:
-:  ---------- > 1:  8fc8c6255e man/man2const/F_DUPFD_QUERY.2const: Add page
-:  ---------- > 2:  a29379d2a6 man/man2const/F_CREATED_QUERY.2const: Add page
-:  ---------- > 3:  fcc62e822a man/man2/fcntl.2: Add section
-- 
2.55.0

