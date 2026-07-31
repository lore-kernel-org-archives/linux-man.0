Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3B325B0B9
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522680; cv=none; b=oPQCPZrVummRxmpCVvWWbkyPs/uzlztcwN6xlKZucSRJ+60jDbWHaFKOxjFml0xtkmShwPkH/wTo8WnblPhzowsjQzxxMJerKdM03duTfSRW4/OUU5ZR1xsr8C38zCmFWSTy7YTeVXgi8Xz5sWrpIzUJ90fj/d+WmP9MhjMLB3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522680; c=relaxed/simple;
	bh=prDlUV1aFa64f/ejywis2b3ncB/ej1aK3NHVQfLV2F4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To:Cc; b=gqsriH2h6SI1ad1yixtbTTAQW6OinhvKt3jMnyqcsUfSCd59qFfZum0i2icFIroDAUhPYDbYshzb/+s5ZskOp7pBcvUomGfc43kC5nJsgPJKUEzzNy67Qb76eMB0TVn7uxLEKycvON/IQyaSRSOKyC7+GIELBqjI7d02EFVSR3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bbaiw/AD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bbaiw/AD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785522678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=vLFbKrG4WXo4X804auR4hQRLogEO+/cDaCUG5XjV17c=;
	b=bbaiw/ADCBrSpp/jdJGqsgKXJZjKP2XrJzHC9QM3wpktweblUsMU7VyBJkNus9SL6RBNL2
	SwN3zw0hP5RQSoCz18fwM78QxiwkDMmAgSDf8PjpeMrgDgHr1PBEoRjfD8q60SKzgxNM8a
	0EgMg9Y2IXVgdXWgOFagBW+BKq0QY40=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-R9Pjht33Pvek-8J1PHPZhg-1; Fri,
 31 Jul 2026 14:31:16 -0400
X-MC-Unique: R9Pjht33Pvek-8J1PHPZhg-1
X-Mimecast-MFC-AGG-ID: R9Pjht33Pvek-8J1PHPZhg_1785522675
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B19EB1800345;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.59])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5E492180044F;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66VIVBDa3140578
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:31:11 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66VIVBrc3140577;
	Fri, 31 Jul 2026 14:31:11 -0400
Message-ID: <ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
In-Reply-To: <cover.1785522144.git.dj@redhat.com>
References: <cover.1785522144.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Fri, 31 Jul 2026 14:22:24 -0400
Subject: [PATCH v3 1/4] man/man5/ld.so.conf.5: document include syntax
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
Cc: alx@kernel.org
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

---
 man/man5/ld.so.conf.5 | 24 ++++++++++++++++++++++++
 man/man8/ldconfig.8   |  2 --
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/man/man5/ld.so.conf.5 b/man/man5/ld.so.conf.5
index 481cf9152..d9fae3c1f 100644
--- a/man/man5/ld.so.conf.5
+++ b/man/man5/ld.so.conf.5
@@ -9,8 +9,32 @@ .SH DESCRIPTION
 This file contains a list of directories,
 one per line,
 in which to search for libraries.
+.P
+The file is parsed by
+.BR \%ldconfig (8)
+and the results stored in
+.IR /etc/ld.so.cache .
+.P
+The syntax allows lines to start with the keyword
+.B include
+followed by a
+.BR glob (7)
+pattern.
+Files matching that pattern will be processed
+as if their contents were included at that point.
 .SH FILES
 .I /etc/ld.so.conf
+.SH EXAMPLES
+Example config file:
+.P
+.in +4n
+.EX
+/lib
+/usr/lib
+/usr/local/lib
+include /etc/ld.so.conf.d/*.conf
+.EE
+.in
 .SH SEE ALSO
 .BR ld.so (8),
 .BR ldconfig (8)
diff --git a/man/man8/ldconfig.8 b/man/man8/ldconfig.8
index 9ac146b44..cb7d62ccc 100644
--- a/man/man8/ldconfig.8
+++ b/man/man8/ldconfig.8
@@ -178,8 +178,6 @@ .SH OPTIONS
 is also specified,
 the cache is still rebuilt.
 .SH FILES
-.\" FIXME Since glibc-2.3.4, "include" directives are supported in ld.so.conf
-.\"
 .\" FIXME Since glibc-2.4, "hwcap" directives are supported in ld.so.conf
 .PD 0
 .TP
-- 
2.47.3

