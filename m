Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574073218BA
	for <linux-man@vger.kernel.org>; Mon,  6 Apr 2026 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775467316; cv=none; b=YKmRlZrn90Jp33XjqzJM3w6e9PfURYvEf+r20Uhbc/kgrfRIF1O3pu0l+BpWCgfB09lUfyJSvvxqv/DRtj6HSCvC58hFJIXPozte+j0udAtB5MabR2JHMzpP2NWKR8ljEnqG2HkwXrV6fS/Ix945oBepwt/7Lgvx4lYkMtiFkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775467316; c=relaxed/simple;
	bh=VprCy3hMczrj50c+vcK9WqOGaubUrtPHg+SQ7tVCrEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cQcITdU5QWhRSXTWHEt8NDrORPebAG2p9Q8ysfQadp8xQZ90+p9KvE3//iKY4xqhKH6ki/qhRI7gkCA54r03DALm3hl0pWaCund+LjpvltOe6eIPCg99hJp2GvyF0kruHD/LChauSTO60gkU4pRG+4KQkf2FMb7BnmxROUzGlt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vursc.org; spf=pass smtp.mailfrom=vursc.org; dkim=pass (2048-bit key) header.d=vursc.org header.i=@vursc.org header.b=mnqNPRqF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vursc.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vursc.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vursc.org header.i=@vursc.org header.b="mnqNPRqF"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4fq3k45DcNz9tcZ;
	Mon,  6 Apr 2026 11:21:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vursc.org; s=MBO0001;
	t=1775467308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xR5y8A6HAitnJqjCtsSWLxs5F7ncYS7YOdGdfjfgggc=;
	b=mnqNPRqFlpfF6B3CzE0QXUVL4KKAdiaqr2+r0pB+C9eOMTAaxgPyqSw5cnmFytcKdmD9oi
	9ubQXzX3W3vK4IlB4+MhFRv9yiu8zQTpO4Lzek9K0m9eCuBsQkf5ogvRg1EApXJqxGh2ce
	i7O+jsZfO4XfVBXBC+MG6a1krMAniXUn4aVH/O5V18FWFn905ny0/DV6T1Gsn4kEzlK3bQ
	mVVVpRb55aWBKjZowcN1c+kCmIfXOI5poObNUIMyGEuyOf3Y5kQWICbOm8nVFcFlOBbiXC
	OCxSLk1jEpQoktoDb1HLLtGUubfyUelhiEfcRMMpoU1lGZDsZ23XQSYQbWpDVw==
From: vursc <vursc@vursc.org>
To: linux-man@vger.kernel.org
Cc: vursc <vursc@vursc.org>
Subject: [PATCH v3] man/man2/getdents.2: Document system call interface of getdents64
Date: Mon,  6 Apr 2026 09:21:14 +0000
Message-ID: <20260406092113.184487-2-vursc@vursc.org>
In-Reply-To: <20260406053554.150929-1-vursc@vursc.org>
References: <20260406053554.150929-1-vursc@vursc.org>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The count argument of the getdents64 system call is assumed to not exceed
INT_MAX. The glibc function accepts a size_t and passes INT_MAX to the kernel
if count exceeds INT_MAX.

Also document the dirent64 structure in glibc.

Signed-off-by: vursc <vursc@vursc.org>
---
 man/man2/getdents.2 | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/man/man2/getdents.2 b/man/man2/getdents.2
index 8c5bbebbc..de91f3800 100644
--- a/man/man2/getdents.2
+++ b/man/man2/getdents.2
@@ -42,7 +42,6 @@ These are not the interfaces you are interested in.
 Look at
 .BR readdir (3)
 for the POSIX-conforming C library interface.
-This page documents the bare kernel system call interfaces.
 .SS getdents()
 The system call
 .BR getdents ()
@@ -216,10 +215,31 @@ using
 .BR syscall (2).
 In that case you will need to define the
 .I linux_dirent
-or
-.I linux_dirent64
 structure yourself.
 .P
+The
+.B getdents64
+system call accepts an
+.B unsigned int
+argument
+.I count
+and assumes that
+.I count
+does not exceed
+.BR INT_MAX .
+The glibc wrapper function sets
+.I count
+to
+.B INT_MAX
+if it exceeds
+.BR INT_MAX .
+glibc defines a
+.I dirent64 
+structure, which is similar to
+.I linux_dirent64
+but with a 256-byte
+.IR d_name .
+.P
 Probably, you want to use
 .BR readdir (3)
 instead of these system calls.
-- 
2.53.0

