Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.91.86.241
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523254;
	b=Py7K4qlxI7BWZ9WoeWBOd1iguOLVH1xKDauyvWx+bd3iR6iXtghit32wbzhoOF5zr91R
	 6UNu5eqdDR4Q8l7KuK95HX4KY14j8bsMt8BU755NCWKNX6Cwpmb2YAEdE9tAOgHln2YIa
	 fQ9Dcq4uSVuU5j2D15wAWbOYP6ZgUx2nI2FinG9j4rSH4e1uBmTrAtwbJcbHzoF1Ar5YV
	 b0QGydojmwwSKM4pkslEl3S4+dfR+/R+Fw7CggSl9LWi7BL2IZJmf65vmtFnJINWHYClZ
	 WP28jfYFbV9MrIDUTWJPv/0lukYHqJzqwU2DqhwmLkKF93yGTs6MKI2XtA3mDsZihbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523254;
	h=DMARC-Filter:X-Report-Abuse:Received:Received:Feedback-ID:Received:
	 From:Subject:To:Content-Type:Content-Transfer-Encoding:Reply-To:Date:
	 Priority:X-Priority:Importance:Message-Id:X-SMTPCOM-Sender-ID:
	 X-SMTPCOM-Tracking-Number:X-SMTPCOM-Message-ID:X-SMTPCOM-Payload:
	 List-Unsubscribe:List-Unsubscribe-Post:DKIM-Signature:DKIM-Signature;
	bh=3gseOYEL9tjQg14DlAsn96Ocdj2Re1FNw/nnQCtfu0E=;
	b=DH4ppcEOO1II70MsCBb3jNjhfnIuL3NJmDVcw+YWpIFRftMmFm+gwEfsSx/xaC/uinBn
	 yITsVtXfcbjSekY/2Cr/h+wyurWYYArWzhSrnAOSMBqVHz7CbjFqhgaqjV/UYzDpM5H5c
	 uXOQz9i2X3ZUrhxn12gy0vz051bU8Az8tqWqj+u1OQBQMVmI+nONAtkjCVqRxVVXJgK/p
	 qG/+J8OtrSUKjDwQcjzMIOLDLEe6xekCptD5NNxgWn7tU4O8Y5Def4d8BvnBE29DH4TBB
	 7jbAPxJIdmnMKXRU6KAnMpAFMFom3Cvhz9Wnz6Lxam+Lw02514tiPCAhOfaqGYxibJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=computergamingpc.com;
	spf=pass smtp.mailfrom=computergamingpc.com;
	dkim=pass header.d=computergamingpc.com header.i=@computergamingpc.com header.a=rsa-sha256 header.s=smtpkey header.b="U8P/OtiU";
	dkim=pass header.d=smtpmessage.com header.i=@smtpmessage.com header.a=rsa-sha256 header.s=smtpcustomer header.b=ItLtGjTA;
	arc=none smtp.remote-ip=74.91.86.241
Received: from mailer241.gate86.rs.smtp.com (mailer241.gate86.rs.smtp.com [74.91.86.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FD2606A31E
	for <linux-man@vger.kernel.org>; Tue, 24 Nov 2026 12:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1FD2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=computergamingpc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=computergamingpc.com header.i=@computergamingpc.com header.a=rsa-sha256 header.s=smtpkey header.b=U8P/OtiU;
	dkim=pass (2048-bit key, unprotected) header.d=smtpmessage.com header.i=@smtpmessage.com header.a=rsa-sha256 header.s=smtpcustomer header.b=ItLtGjTA
X-Report-Abuse: SMTP.com is an email service provider. Our abuse team cares
 about your feedback. Please contact abuse@smtp.com for further investigation.
Received: from [10.0.16.115] (unknown [10.138.12.16])
	by s0-aws-app-mta-out-2 (Halon) with ESMTP
	id fe8d369f-6bd6-4919-ad04-318950f3a21b;
	Tue, 24 Nov 2026 12:27:26 +0000 (UTC)
Received: Received from 10.138.12.40 by Caffeine (s0-aws-app-swarm-manager-4)
 with SMTP id 6028d596-7189-40e3-9e6a-9a0820cf188f  for
 linux-man@vger.kernel.org;  Tue, 24 Nov 2026 12:27:18 +0000 (UTC)
Feedback-ID: 9194450:SMTPCOM
Received: from ObaTech (unknown [191.177.202.135])
	by s0-aws-app-mta-in-1 (Halon) with ESMTPSA
	id 6028d596-7189-40e3-9e6a-9a0820cf188f;
	Tue, 24 Nov 2026 12:27:18 +0000 (UTC)
From: "Computer Gaming pc" <sales@computergamingpc.com>
Subject: Q2 Stock Update: Mobile, GPU & Storage Units
To: <linux-man@vger.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Reply-To: <sales@computergamingpc.com>
Date: Tue, 24 Nov 2026 12:27:17 +0000
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <24172026112712D633DAC615-DD261B49B8@computergamingpc.com>
X-SMTPCOM-Sender-ID: 9194450
X-SMTPCOM-Tracking-Number: 6028d596-7189-40e3-9e6a-9a0820cf188f
X-SMTPCOM-Message-ID: cf2a0af4-2905-49ee-bc63-fc9043622f53
X-SMTPCOM-Payload: 
 8MSkYQpLJCRFQOytSR6ZAGpObk2GS8xkgDnGKJZDU7I24r2wL5vBTzbmyU62MuIIzaKS6jZVUWkeTucC2F-qCBRBy4-0AEPIoLsf6DXupVplIJn3PJ_99aU-C9Vbz7x_W4N4-nyuS9M7dVsC6JSOLjmIjGs3UR_IAVM7lxZTwd-Xjs0FVaIrgpPsxJ3uRZoO
List-Unsubscribe-Post: List-Unsubscribe=One-Click
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=computergamingpc.com; i=@computergamingpc.com; q=dns/txt; s=smtpkey;
 t=1795523243; h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=7meXGjHAiPAIVHmWucwxztaiCZ1dye52HLBDqR7BC+Q=;
 b=U8P/OtiUQLY/UQBUe3aVccO8cc9Y4m9j6L0EEFawOmc6VkC1WLLyV0QmD+E3rjOciwnZY
 ostYr5+lG9H4TvT459Ph/lzCROupEce04HmrF4TtdjF65XZJwWEvRjwM/Wv2nr7ANUSmhhf
 A2RysM1c5Jxi4QqN2GQj50TEPVr23dA7NZNGFi3CnDYDQuti8ZCnFoQ1anlJQIaTKUh+Zuw
 UgUEXaL3G54kU6Vji4zzl0G5lXx45/TtnN2pg4jce6C+32SqHrt5I0cm4RefsHVsWNECFv4
 IE7Wl1elbf29hc9+uH7nt3sQbJ1XB8K56+PWFiR6XTI12f5KTEE2mDwt/Vew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=smtpmessage.com;
 i=@smtpmessage.com; q=dns/txt; s=smtpcustomer; t=1795523243;
 h=feedback-id : from : subject : to : content-type :
 content-transfer-encoding : reply-to : date : message-id :
 list-unsubscribe : list-unsubscribe-post : from : subject : to : date;
 bh=7meXGjHAiPAIVHmWucwxztaiCZ1dye52HLBDqR7BC+Q=;
 b=ItLtGjTAOe1hOdf4+9Uf39HS1ywA9okCVcjFNgPgKqH5TsEj4Er+K9uNGhpjee3gK580W
 132ohB+W82K0I15BrzWkLWuxSEXwpFiYrGE/+3L+HuUyYsUO5Yg+4heGUiCMAfljtB/tPC3
 V90allMpQQKmtWEi8LIcLjyeDlaRS2w2/9h7+tRO1twVHDCnQhal9/BaYXpeqzHaLyMHZk/
 X3njT3RuREmPPfToNd2T8qYW9c1m6B8tmn8u/chguVVLpa/9V0Q/5tWzxYI+7UVZE52W1II
 fzwVXHyFsCRvt8P8OR9RFxjo1hZPuwdfpShpN8QO8XGwD/q/yDVaGEz0UYBw==
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list

Hi
Quick update — these units are in stock and can ship today:

Memory Modules
* 128GB 4DRx4 DDR4 PC4-2933Y REG ECC LRDIMM (Qty: 980) – $140.00
* 32GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,500) – $1,140.00
* 64GB Dual Rank x4 DDR4-2933 CAS-21 (Qty: 1,200) – $1,450.00
* 32GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,500) – $1,150.00
* 64GB Dual Rank x4 DDR4-3200 CAS-22 (Qty: 1,100) – $1,450.00
* 32GB 2Rx4 PC4-2400T (Qty: 1,500) – $45.00
* 32GB 2Rx4 PC4-3200AA (Qty: 1,500) – $45.00
* 16GB 2Rx8 PC4-3200AA (Qty: 1,500) – $20.00

Solid State Drives
- SSD SATA 6G 3.84TB SFF (Qty: 450) – $120.00
- SSD SAS 12G 960GB SFF (Qty: 470) – $300.00
- SSD SAS 12G 1.92TB SFF (Qty: 560) – $350.00 
- SSD SAS 12G 3.84TB SFF (Qty: 560) – $150.00
- SSD SATA 6G 1.92TB SFF (Qty: 450) – $100.00 
- Samsung 990 PRO 1TB NVME SSD QTY:410 - $150

- HP (HPE) P43331-B21 64GB DDR5-4800 RDIMM QTY: 390 - $1,750
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 P43331-B21 (Qty: 500) – $1,750.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 P64707-B21 (Qty: 500) – $1,750.00
- DDR4 64GB 3200Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $1,450.00
- DDR5 64GB 4800Mhz ECC RDimm 2Rx4 Samsung (Qty: 500) – $1,450.00
- DDR5 64GB 5600Mhz ECC RDimm 2Rx4 SK Hynix (Qty: 500) – $1,550.00
- Intel Xeon Silver 4214R - QTY: 420 $350.00
- Intel Xeon Gold 5220R - QTY: 410 - $550.00
- Intel Xeon Platinum 8380: $2,450.00 QTY: 410
- AMD EPYC 7542 - QTY: 490-- $380.00

GPUs & Accelerators
RTX 5090 Founders Edition 32GB (90 units) – $2,800 
RTX 4090 Founders Edition 24GB (90 units) – $2,500 
RTX A6000 48GB Ada (54 units) – $1,100 
RTX 6000 48GB Ada (51 units) – $1,200 
Nvidia L40s GPU (12 units) – $5,000 
Nvidia H100 80GB PCIe (9 units) – $20,000
NVIDIA H200 NVL 141GB — Qty: 10 — $26,500
Nvidia PRO 6000 96G Server Edition -34 units- $10,000.00
ASUS TUF Gaming RTX 4090 24GB (56 unit - $1,500.00
Gigabyte 4090 Windforce V2 24G (56 unit - $1,500.00

For quotes, availability, or inspection scheduling, please reach out 
directly:
sales@computergamingpc.com Call or WhatsApp: +1(774) 559-1248 | +1 (641)232-
4364
Thank you for your continued partnership.
Ann Kamila
Computer Gaming PC Trading
2500 US-6, Iowa City, IA 52240, USA.
