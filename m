Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F62141A794
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522682; cv=none; b=PLiCDpx+TbFRajIElUWoFBGqaMYmU/yz8TDCVhxmEttYxmhVD2vxnC9V5nBe2X1yXdst9h1XhBjRnF4bZePSLR2NJEYPfeTbkiFmzZLOQzLLFuUqea0MldpB2PMgp4dL6GfcGY0y0Vq3zx+Bm3HHSniu1dfGzmGOifInOgLxJ+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522682; c=relaxed/simple;
	bh=Qam0t9veWxezsjnQE4mjTrnx8r/erYSqFXx9yobKvYo=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To:Cc; b=aYhuJbtpoiawgPEt9WV7+PT2uoAmrd206iBB7T5lIcpvFRVFrc8GdwCy+qkFt0fkS0i+TRSW1zXiedJUEpiE1FW/ia+cdTz14lPEyyfYmuQ8gaDBrFMxJu0vexMtGfxlHKcKpJjZwKIRSqLvekpWOTfwYSR/NkNYrA6uz//Kq9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QDQ8XMmj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDQ8XMmj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785522680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=jr78ispejzoYvU0zq/eV6k4cxTbUXEusKayMaT5hYhY=;
	b=QDQ8XMmjg5x82DoBVDSb9PI+nkA+DPyeT8JGg/XBrIVFNs4JeXmasxxlKHZOeOZm0dCF/L
	o2DIMNDSpky2haZOHRz2GWNYSo7nTtuzKqhVJ1ZAn30g5N4bgThkp3Ry++NZd4EjjRF2B/
	fEG86ZGkMB6pRwGB+JfZ9Zv3FkJeQA4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-yKmdF70iM7i0kTPo_5JGYA-1; Fri,
 31 Jul 2026 14:31:16 -0400
X-MC-Unique: yKmdF70iM7i0kTPo_5JGYA-1
X-Mimecast-MFC-AGG-ID: yKmdF70iM7i0kTPo_5JGYA_1785522675
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9931C195609F;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.59])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 50C5818004AD;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66VIVCgv3140590
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:31:12 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66VIVCcT3140589;
	Fri, 31 Jul 2026 14:31:12 -0400
Message-ID: <d85795998b72ab686a683f13d08f24d98d8c1a51.1785522144.git.dj@redhat.com>
In-Reply-To: <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
References: <cover.1785522144.git.dj@redhat.com>
	<ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
	<4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
	<bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Fri, 31 Jul 2026 14:22:24 -0400
Subject: [PATCH v3 4/4] man/man8/ldconfig.8: Add tunables options
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
Cc: alx@kernel.org
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

---
 man/man8/ldconfig.8 | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/man/man8/ldconfig.8 b/man/man8/ldconfig.8
index cb7d62ccc..e575fdec6 100644
--- a/man/man8/ldconfig.8
+++ b/man/man8/ldconfig.8
@@ -17,6 +17,8 @@ .SH SYNOPSIS
 .IR conf ]
 .RB [ \-r\~\c
 .IR root ]
+.RB [ \-t\~\c
+.IR tunconf ]
 .IR directory \~.\|.\|.
 .YS
 .SY /sbin/ldconfig
@@ -85,6 +87,13 @@ .SH DESCRIPTION
 .P
 Failure to follow this pattern may result in compatibility issues
 after an upgrade.
+.P
+If the file
+.I /etc/tunables.conf
+exists,
+it contains tunables to be applied to all processes.
+These tunables are stored
+in the cache and applied to every process at its startup.
 .SH OPTIONS
 .TP
 .BI \-\-format= fmt
@@ -157,6 +166,12 @@ .SH OPTIONS
 .I root
 as the root directory.
 .TP
+.BI \-t\~ tunconf
+Use
+.I tunconf
+instead of
+.IR /etc/tunables.conf .
+.TP
 .B \-\-verbose
 .TQ
 .B \-v
@@ -188,11 +203,17 @@ .SH FILES
 See
 .BR ld.so.conf (5).
 .TP
+.I /etc/tunables.conf
+See
+.BR tunables.conf (5).
+.TP
 .I /etc/ld.so.cache
 contains an ordered list of libraries found in the directories
 specified in
 .IR /etc/ld.so.conf ,
-as well as those found in the trusted directories.
+as well as those found in the trusted directories,
+and any tunables listed in
+.IR /etc/tunables.conf .
 .PD
 .SH SEE ALSO
 .BR ldd (1),
-- 
2.47.3

