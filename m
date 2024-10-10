Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306168F6A
	for <linux-man@vger.kernel.org>; Thu, 10 Oct 2024 21:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728596506; cv=none; b=T0Q00w7rDPm3JQFiQW4nYCYsKWlTNe6iYgTzHqwQo8xy1oNyb11YIlhthQfTvS+bAz4PJ1MisewqVH4SD7p+qbd2lMKRkgWRVmGH7flE/OQDRQHtHNvd71fmEiqnFR4JNbJJVaWCNo9lockDcTlwoJOBebcmkejgaQLw3pR8XlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728596506; c=relaxed/simple;
	bh=j3nLbuOk6eQsqtGUL+XtAdJBCcrG0AjKVwALZZ2f08s=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+d/djW4pA/0BTXTHpoqTArE7TZA6NwRblcy7gl9Bf1yUYZQFqDFfzBrRAzh5t+Gyhax69f44ZrATNQESOWzEeKY6SJJqUDQxCeS0gFuDECPLIHqmuGbYgNLQOjyAxMft4llMBZ7JzN7uolMUy6cSGhpO5odtGooJxzdN3meNqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PDfs+RNy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PDfs+RNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728596504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=j3nLbuOk6eQsqtGUL+XtAdJBCcrG0AjKVwALZZ2f08s=;
	b=PDfs+RNy3/MbAO+ZqVBWADzJp/w+I0WmwHAiHSHbyyM7axY9Kz6TpE1DKxnE0SKog8htyx
	l18fj8IGJVMDB9kmP5ShV7EplIDqmNJ/P1ijayWVakILkFrqLhSIK0yfUqw3iTF2kf3bt4
	PT7P8CHyZNpS+WMBoLZk7128aR0sXXs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-414-cRkp_BlcP4-jtBO-kOtdrA-1; Thu,
 10 Oct 2024 17:41:40 -0400
X-MC-Unique: cRkp_BlcP4-jtBO-kOtdrA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9D0241956095;
	Thu, 10 Oct 2024 21:41:39 +0000 (UTC)
Received: from localhost (unknown [10.22.64.96])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 432E51956052;
	Thu, 10 Oct 2024 21:41:39 +0000 (UTC)
From: tyberry@redhat.com
Date: Thu, 10 Oct 2024 17:41:38 -0400
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, lgoncalv@redhat.com
Subject: [PATCH] madvise: MADV_SOFT_OFFLINE requests can return -EBUSY
Message-ID: <ZwhJXaNGoA4Y1UNz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

If any page(s) within the add+length range could not be offlined madvise
will return -EBUSY. This might occur if the page is currently in use or
locked.

Signed-off-by: Tyonnchie Berry <tyberry@redhat.com>

---

diff --git a/man/man2/madvise.2 b/man/man2/madvise.2
index 441edfbc1..13ee7957c 100644
--- a/man/man2/madvise.2
+++ b/man/man2/madvise.2
@@ -702,6 +702,11 @@ The map exists, but the area maps something that isn't a file.
 .BR MADV_COLLAPSE )
 Could not charge hugepage to cgroup: cgroup limit exceeded.
 .TP
+.B EBUSY
+(for
+.B MADV_SOFT_OFFLINE )
+If any page(s) within the add+length range could not be offlined madvise will return -EBUSY. This might occur if the page is currently in use or locked.
+.TP
 .B EFAULT
 .I advice
 is

