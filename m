Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28A92BEC5E
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784084453; cv=none; b=AT+LPf/dNQtvCSZlzIWcNnlcoiqB8v54mtNk0EP07veZtFDWNenVm/K6E6BLCyyixCdL3URNA6+oz/v2AysAVPuUZvkoF99Ni4QGNKhe8IFEtDSk3Va5p/w3XcFVImEMdrsuZlbVvEJE/koGUy8v6XARp5jWpM/T0Y/9NCES3S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784084453; c=relaxed/simple;
	bh=s8DgyCCZ2udbfuxPsfDEJqxX3H9BNr+IKO71139nBQM=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To; b=SX+d/QQ6v0lQp08LGYEqiJlji83iD91zxclEvgoGp2/gq3bwPuKq9MHG8AvDrtpcEGUzKsaFr8j8zfNsfXvHZ6KYuDViL3CS6SoZQboetKD0Y45tG8JJ9l03+PrW+5Cr7hC7fYuPW8MvCG7eZmac6CoB1i/nZ+IKsvzHrRoDL/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UuenH0BO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UuenH0BO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784084451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=th2LcjZ+cUwJe3wtUQFGz8lHuu7rMaPb0NmmlIgimR8=;
	b=UuenH0BOwtHBYUT8rhvP7uiSFkIUMSjzhmOaViNpzPU4Vdetr01JMz2GzjdBSeBNRUkOLE
	rrSteM6c/ThssRjHpCPZ7DAUwOqn3LzzOX032CWLfA3iTQx1NCwG/WMLCa45I+BiIAyavR
	+bKFp4zSa7+UeTLNhYurUPIxPTusYsI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-HPgcK3BLNfed8NZkjiBEWA-1; Tue,
 14 Jul 2026 23:00:49 -0400
X-MC-Unique: HPgcK3BLNfed8NZkjiBEWA-1
X-Mimecast-MFC-AGG-ID: HPgcK3BLNfed8NZkjiBEWA_1784084448
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CD04A1956089
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:48 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8ED2C180058F
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 03:00:48 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66F30laS1140979
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <linux-man@vger.kernel.org>; Tue, 14 Jul 2026 23:00:47 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66F30lor1140978;
	Tue, 14 Jul 2026 23:00:47 -0400
Message-ID: <c1f11edbb9896b4db00b7824806d364ef52ef4fb.1784084289.git.dj@redhat.com>
In-Reply-To: <fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>
References: <cover.1784084289.git.dj@redhat.com>
	<ad382eef274a64bfa0724a31f09846948a84142b.1784084289.git.dj@redhat.com>
	<fed61f93333ec0421dc9adc5af05d740a2e4bcd7.1784084289.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Tue, 14 Jul 2026 22:58:09 -0400
Subject: [PATCH v2 3/4] man/man8/ld.so.8: Note that ld.so.cache includes
 tunables
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

---
 man/man8/ld.so.8 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man8/ld.so.8 b/man/man8/ld.so.8
index 5f3c22ef2..8916f2443 100644
--- a/man/man8/ld.so.8
+++ b/man/man8/ld.so.8
@@ -792,7 +792,8 @@ .SH FILES
 .TP
 .I /etc/ld.so.cache
 File containing a compiled list of directories in which to search for
-shared objects and an ordered list of candidate shared objects.
+shared objects and an ordered list of candidate shared objects,
+and any tunables to be applied.
 See
 .BR ldconfig (8).
 .TP
-- 
2.47.3

