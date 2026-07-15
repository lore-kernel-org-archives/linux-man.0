Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5D352021
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084453; cv=none; b=ZzTpbqXabbyOpgIwt6C/COq5ZpfRRWPbC+9k+M+UVomH2Qp8+eK9o5oma7LRNydz4epR9RubP0GSGEMxCyWwA/rS5+fmBQaa9UOTpOVJk5bxlRea1wplORSk6eu7Q/RaVteWk6tq8ymnRoPoz6WXm8NwUlH7kPXntYnW3gErexA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084453; c=relaxed/simple;
	bh=Qam0t9veWxezsjnQE4mjTrnx8r/erYSqFXx9yobKvYo=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To; b=rriflba/c1svbvkntP3baUd3Q8pJjkhz2yjH+dtt+5u0MTHAVnAQ76A6J/MFCO6QT/pSNmy18ryJZg+VPYC6CmMI8UfhCb8FzzzspGgQk2rQQb/9Wh24QTyYX7ldQ0Lsl++BTGqxTncr4Cm5EiZQpoEZtbThsUlzGpr4wF7ICkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXYJjq/c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXYJjq/c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=jr78ispejzoYvU0zq/eV6k4cxTbUXEusKayMaT5hYhY=;
	b=NXYJjq/cE2IVbkXR/aQVCDkxlJ7/jokbbX03UF886caV3uypYNFq6P0L+0bDRmAkbe9cD/
	PFdKWso/seuYQHmvdpBNKLmRTE5dgNzZoyA3y9awTRzEcNswLQtnejfdUSq2iag02BGpc7
	aK1QSnMoZM5OMmdsX9zUaAOVYntXW7k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-678-CMhHjIXePoCea6FHdT6bOQ-1; Tue,
 14 Jul 2026 23:00:49 -0400
X-MC-Unique: CMhHjIXePoCea6FHdT6bOQ-1
X-Mimecast-MFC-AGG-ID: CMhHjIXePoCea6FHdT6bOQ_1784084449
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0255A19560B2
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:49 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B7E881955F43
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:48 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66F30ltS1140983
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-man@vger.kernel.org>; Tue, 14 Jul 2026 23:00:47 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66F30lFs1140982;
	Tue, 14 Jul 2026 23:00:47 -0400
Message-ID: <43a361c5783620c4969e10c7eb1516a0cf2d727e.1784084289.git.dj@redhat.com>
In-Reply-To: <c1f11edbb9896b4db00b7824806d364ef52ef4fb.1784084289.git.dj@redhat.com>
References: <cover.1784084289.git.dj@redhat.com>
	<ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
	<fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>
	<c1f11edbb9896b4db00b7824806d364ef52ef4fb.1784084289.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Tue, 14 Jul 2026 22:58:09 -0400
Subject: [PATCH v2 4/4] man/man8/ldconfig.8: Add tunables options
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

