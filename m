Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DD2EEE80
	for <linux-man@vger.kernel.org>; Sat, 22 Aug 2026 17:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787421248; cv=none; b=G7Tgnof4oHZh0Qzz+MSFDutRim+LaFn5t5PcX5E2DAxqSGs5hoyWWmYsB8nFvy8ioh5xtqnLIJPpqNyrC5igz8pMhYJmQq4tj6w4RTGazsA/xh+pP6Izf8OU0lkdFmlfzOLBcLXgf8HAJOQiliqUhNH/ZmhUO6LW/TeGLlKre24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787421248; c=relaxed/simple;
	bh=IJdaCGzdYflbiHv45QreIafBHhl7r8IuEmqaTV8ZObw=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=gvnDvdXRobJwIOlyWt23/4XmzG5ENQk47WdwTE0dDWjIiqEgumHAd8fdESZ7PIQOpkRjUEW8LTdh/0pORfzoNRF8ADZJ0U40n210w4pSd2WtPkUdiQPL6QiH6Xl9lJOBHFhqY1iv03KROV8y/xq7iZlfdsnZe57vqQB7hfQGevU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hzMEVk0Z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hzMEVk0Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787421245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=UlWmEpJGAy0U0bg+EGeOX0n1YgjaJZ8O15H4XgW373U=;
	b=hzMEVk0ZwfR9ldaraaKn4eB1Cw5cJU4Kwy4h49DHd3KZKCr7wm8wzdbeoZvV/dD44x8FKl
	7M7eWorajVXyhQ7WugsmKl1LFwwD9pjBrg8LUdeSXojq87FFHsJfJWjc+QG1wxccV9zush
	D6oNkEs6Kkr3RJvLzi7eP1YYLLOv214=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-307-qdNUUdZ7O2qDsZXjOCRVVQ-1; Sat,
 22 Aug 2026 13:54:04 -0400
X-MC-Unique: qdNUUdZ7O2qDsZXjOCRVVQ-1
X-Mimecast-MFC-AGG-ID: qdNUUdZ7O2qDsZXjOCRVVQ_1787421243
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3EFB71953999;
	Sat, 22 Aug 2026 17:54:03 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.30])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3A4118005BD;
	Sat, 22 Aug 2026 17:54:02 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 67MHs121375051;
	Sat, 22 Aug 2026 13:54:01 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <aonfyurBGGpdjEil@devuan> (message from Alejandro Colomar on
 Sat, 22 Aug 2026 19:47:26 +0200)
Date: Sat, 22 Aug 2026 13:54:01 -0400
Message-ID: <xn8q5y9h3a.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Alejandro Colomar <alx@kernel.org> writes:
> Another detail I noticed now: How is the process name taken?

The kernel doesn't actually tell us the name of the file we're exec'd
from.  It passes an already open file descriptor.  So we have to infer
the file name from /proc/self/exe.  If that isn't available, we use
argv[0] (unless AT_SECURE) but that can be vastly different than
/proc/self/exe as it's a separate parameter in the execve() call (hence
unless AT_SECURE ;).

