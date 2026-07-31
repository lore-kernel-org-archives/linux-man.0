Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705173AFCE3
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 18:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522682; cv=none; b=C/Jradlp8j4rOofzJ+kapPRyenB/0OKsJ7PmnL2ic44umP0vclKF1gZDTBMToBYetgz8Kr13+Y6jRrZMID6D1GOrXsu//4SbAYRihz4m18/EVLEH4MJ0KrR+F48oR86sMs/BhyY6CAJCIH2Ch7eICouhfGvRXF7cP22xA5DMz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522682; c=relaxed/simple;
	bh=gZ+aiO5TPPCHi71r8P1IEi8P8LtfdmVRo20vF1mix1g=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:Content-type:
	 To:Cc; b=cyNO0sXjai4Ylpms5j6fWhCAoPsKz5rHt9vfCrCNz/tH0hsmGci4mr02huJoC0bVz0Q1wekghrHYIXPUfjbjay47k1i9KSAlgdXQ3afYEBMyou0oURo4kgoVSCxrSWli/abzQVFzuTk2jXCf+cARR2+Nltdo50xElApcd9yGrgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ROD+3m3V; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ROD+3m3V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785522680;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
	 references:references; bh=ZiOQTKOOO05Ye3gYI7ad/mgK8s+1XWXKsCQEV9A8CV4=;
	b=ROD+3m3VslFSs4z98R6wVl8Z7eQZCjMoKvvD/bnAFtIouvhKoFFgAwh65kgrdQev/AOZHv
	ijio2QcItx4yghZI3Tz+GbGY6ZhadLZ7jhUwKefP1KdjxceRxPmWoaN7ryK4G+5lCi38qt
	d1EKQXvEt/R14LLKUdD4+OGwNU+4RDI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-557-PfZVjKHVPOiXTi08VV4-Rw-1; Fri,
 31 Jul 2026 14:31:16 -0400
X-MC-Unique: PfZVjKHVPOiXTi08VV4-Rw-1
X-Mimecast-MFC-AGG-ID: PfZVjKHVPOiXTi08VV4-Rw_1785522675
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A3D0A1955F44;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.59])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B1CF1956044;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66VIVBFc3140586
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:31:12 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66VIVBxo3140585;
	Fri, 31 Jul 2026 14:31:11 -0400
Message-ID: <bcaddcd0fb8f60276973ae28f091c158332e20c6.1785522144.git.dj@redhat.com>
In-Reply-To: <4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
References: <cover.1785522144.git.dj@redhat.com>
	<ae9c2cc67047902f68f64d05ca454da0e6d008b3.1785522144.git.dj@redhat.com>
	<4e0cadac19fdaa29081a226cbd6f98a0b5b6a02b.1785522144.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Fri, 31 Jul 2026 14:22:24 -0400
Subject: [PATCH v3 3/4] man/man8/ld.so.8: Note that ld.so.cache includes
 tunables
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
Cc: alx@kernel.org
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

---
 man/man8/ld.so.8 | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/man/man8/ld.so.8 b/man/man8/ld.so.8
index d1d60cefd..36c8db275 100644
--- a/man/man8/ld.so.8
+++ b/man/man8/ld.so.8
@@ -793,7 +793,8 @@ .SH FILES
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

