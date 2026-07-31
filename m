Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565FF41A794
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522680; cv=none; b=bePR8KH5bdimPWgzjF2xPuJHX09941N5LYgmFjxkDGIGv/EYFWtMnV3qV5dQ2ucX7zfzNXiFeiqAGGL5JcP5CcOJlWF7zlV3AH10LqJgtjAUGm5mAQVs4C3iizQ+RJ8ecgbPOdfMKc9Rt+jt3fOAFMf8vtqyb9LmB9zXmcFajvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522680; c=relaxed/simple;
	bh=yhTa87l8ivkIG+W9Rkkg5jcTEugRWwW+ZpW9KxoWaEM=;
	h=Message-ID:From:Date:Subject:Content-type:To:Cc; b=pYtQWx6sHfnekJf1+PD8OTH26D+uhwN9Nd+VSA3hCsQb0M9nGqo9LvjD+x4dDMo47RJXbTm/7Bq2ztOIX7fRCvfjIHRWo8lWSMZhsQydPDSixd8VmwKlFJl20IuS87Oc38boIV0ED4THcPrMETjSk1FflQabmTXdphNgeGEz+Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HRo1+KFE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HRo1+KFE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785522678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type;
	bh=q/iqNA3bjQPavJIQ84n6IEXbdUy7J5+mcJS/UUZKoMI=;
	b=HRo1+KFEaKbPuyhUZEn2MSTJEJes8MfyDRKVeY31PsagvLInQ42wTeESpDK5OeM1SGTRIV
	VJL66H897ONhL2H1MWcJJGd+8nO07iEShI2g2y1+hNDGdQp6G9E2mpUWNMd/rCmrv44qmZ
	oiqai05GW/azmnqALed/dEeLrlHKoOM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-642-ckVfdOvJP12oBktXtWlDaw-1; Fri,
 31 Jul 2026 14:31:16 -0400
X-MC-Unique: ckVfdOvJP12oBktXtWlDaw-1
X-Mimecast-MFC-AGG-ID: ckVfdOvJP12oBktXtWlDaw_1785522675
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A40B5195609F;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.59])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 525D41956047;
	Fri, 31 Jul 2026 18:31:15 +0000 (UTC)
Received: from greed.delorie.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTPS id 66VIVBGO3140574
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 31 Jul 2026 14:31:11 -0400
Received: (from dj@localhost)
	by greed.delorie.com (8.16.1/8.16.1/Submit) id 66VIVBvM3140573;
	Fri, 31 Jul 2026 14:31:11 -0400
Message-ID: <cover.1785522144.git.dj@redhat.com>
From: DJ Delorie <dj@redhat.com>
Date: Fri, 31 Jul 2026 14:22:24 -0400
Subject: [PATCH v3 0/4] Tunables-related updates
Content-type: text/plain; charset=UTF-8
To: linux-man@vger.kernel.org
Cc: alx@kernel.org
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>

DJ Delorie (4):
  man/man5/ld.so.conf.5: document include syntax
  man/man5/tunables.conf: Document system-wide tunables config
  man/man8/ld.so.8: Note that ld.so.cache includes tunables
  man/man8/ldconfig.8: Add tunables options

 man/man5/ld.so.conf.5    |  24 +++++++
 man/man5/tunables.conf.5 | 134 +++++++++++++++++++++++++++++++++++++++
 man/man8/ld.so.8         |   3 +-
 man/man8/ldconfig.8      |  25 +++++++-
 4 files changed, 182 insertions(+), 4 deletions(-)
 create mode 100644 man/man5/tunables.conf.5

-- 
2.47.3

