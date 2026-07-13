Received: from mail.smrk.net (mail.smrk.net [45.76.87.244])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE11F3B8A
	for <linux-man@vger.kernel.org>; Mon, 13 Jul 2026 12:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.87.244
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944701; cv=none; b=jhYXAgPa5/K1lC/I206/8ZGF/MwG0WfFk3psx6LGL6Ik4WF1mo9wsN0yy5qd/EHcfoSLps9pldHuA7wz8eSty9sL/oUVkT/9ePLdwBLE4Cvs7UwJOm3eBQzcyKbC1v1771teODo77zkRzEgJjLotkvG1j/I1QqrxLXJbyIdPVgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944701; c=relaxed/simple;
	bh=TNY5vv91qAszBNO31H8m2ZVp5RKgMnHhuOA1jhb2LQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dI72Rx7a4g2jvGytYNDw2LiO4yUKTVDIhNOwE0g5d7j6bq9TbKrIfkN6OoeGSHiq/smlJ6dkNi/PpA2kxPtjUdM52pst18f5Ytn/4SV3NzIG0S1SKaYb2Bh/ciDxtgnJuYNWMRqPYB2qZXpoT/meSSvUvY4YryqWUPBPLvnlCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net; spf=pass smtp.mailfrom=smrk.net; dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b=ik+3Ocoi; arc=none smtp.client-ip=45.76.87.244
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smrk.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smrk.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smrk.net header.i=@smrk.net header.b="ik+3Ocoi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smrk.net; s=20221002;
	t=1783944696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a8QjduzcjkkB2swhLZnJAguEhDEe8OQDkhUVgPw388k=;
	b=ik+3Ocoii/YLptC+EpqsLXLtCNEwbz8cUD2aBi1+8WZzXwACJBIUUKZe5TD2T7VGisC0nn
	SNS4YTrJ2E5vubMR05hx3s5Qq4fIXh6cxnXdQUDYyisMcXWnAC/iWCa/9077iWrA7RTASj
	Gv+SeEPWR2nAOQ+PXVHYuI5DqNM4N5oK+yd+NPx3B2bEcNKogiayQRpDQVos1hvGOhQhC2
	bjSS9lUAeirn1Avd/m1anc3ILq0TJSD+hgMJVqanMLH9qnpDXZqqzyD8UBcfwmrrt2kkLP
	Ib7mxB2UYN6rR5LgohfJs00MmKX7escgIr79b6YvAsGOIaKyaS6DeMZ1UOFYKA==
Received: from localhost (<unknown> [192.168.5.2])
	by smrk (OpenSMTPD) with ESMTPSA id 2c91268d (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 13 Jul 2026 14:11:36 +0200 (CEST)
From: =?UTF-8?q?=C5=A0t=C4=9Bp=C3=A1n=20N=C4=9Bmec?= <stepnem@smrk.net>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH] man/man2/memfd_secret.2: tfix
Date: Mon, 13 Jul 2026 14:11:11 +0200
Message-ID: <20260713121111.372487-1-stepnem@smrk.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <alEfVXgJBmtlCtH0@devuan>
References: <20260709153422.210312-1-stepnem@smrk.net> <alEfVXgJBmtlCtH0@devuan>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes: ac5edfeb1dd6 (2021-08-27; "memfd_secret.2: New page describing memfd_secret() system call")
Cc: Mike Rapoport <rppt@linux.ibm.com>
Signed-off-by: Štěpán Němec <stepnem@smrk.net>
---
On Fri, 10 Jul 2026 18:44:19 +0200
Alejandro Colomar wrote:

> I think I'd fix this typo in a separate commit, since it's a meaningful
> typo (both EMFILE and ENFILE exist, and they have a slightly different
> meaning).
>
> In the fix, please include the following tags:
>
> 	Fixes: ac5edfeb1dd6 (2021-08-27; "memfd_secret.2: New page describing memfd_secret() system call")
> 	Cc: Mike Rapoport <rppt@linux.ibm.com>

Fair enough.

FWIW, out of abundance of caution (admittedly verging on paranoia), I
did verify that unprivileged memfd_secret distinguished EMFILE and
ENFILE as expected (brought about by setrlimit for the former and
limiting fs.file-max for the latter in a VM running a recent alpine-edge
image) before sending the original patch, but the hypothesis that this
was anything other than a typo or a copy-paste error seemed too
far-fetched to mention that.

 man/man2/memfd_secret.2 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/man/man2/memfd_secret.2 b/man/man2/memfd_secret.2
index 0ea4b8e93c37..4033adc75772 100644
--- a/man/man2/memfd_secret.2
+++ b/man/man2/memfd_secret.2
@@ -119,7 +119,7 @@ .SH ERRORS
 .B EMFILE
 The per-process limit on the number of open file descriptors has been reached.
 .TP
-.B EMFILE
+.B ENFILE
 The system-wide limit on the total number of open files has been reached.
 .TP
 .B ENOMEM

-- 
2.55.0

