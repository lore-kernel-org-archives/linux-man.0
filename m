Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50019421221
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 20:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786048962; cv=none; b=J6/JOYaOacpI21MpbTiPBg1pKQg0V55jL9W50NJvKeMWnqmi3AHlQPvoh9JN+NPBAC1SljAAiVXtGJLjdH0LlleTTTdsDnSlgp0qYb4VlQ9q4h9zEVRuRj6KELgXYEhQfLte4xC4pSOmno/I3tbTQN4dFFob1GXmZBGVYPUpcoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786048962; c=relaxed/simple;
	bh=nVoBPW2pYcB7JpdYQpl4hFTyP41xjVRzaNzUKAr6qVc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=teGtQoimYXtqK0kFCS0sHiU5//4CbdPvNdJ6WiC7pKgo91W9xst9weSk/UHk2GWyEFtj63iyySpA7hT57OqjtFX33Cr8e2FRrNP1MD1y8qkaO7LBjqAFipKrXs/jnu9PohFtEIPPQC2B+uiYwTLu4o+TRn/7PXex7G0op76L7Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TRgukapR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TRgukapR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786048960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=nVoBPW2pYcB7JpdYQpl4hFTyP41xjVRzaNzUKAr6qVc=;
	b=TRgukapRoBfBEUoFPYKv1gZdZJjscTd/meM5AwPODI5yxdVGlpEw60WnU3h6ZJwRHghCie
	W/ugP1lKyuFRL/1QqZ3oml1nMLE+CcS7K8bykRjd6JnHhABmiXPK02FpVTHWKb8lnVLxvz
	cX8tNW7ZJEIKnTzak/32W50KalkfTcI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-LoYO2i5xOoW7BfrQVG4Hug-1; Thu,
 06 Aug 2026 16:42:38 -0400
X-MC-Unique: LoYO2i5xOoW7BfrQVG4Hug-1
X-Mimecast-MFC-AGG-ID: LoYO2i5xOoW7BfrQVG4Hug_1786048958
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4DF019560B4;
	Thu,  6 Aug 2026 20:42:37 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C5C01800348;
	Thu,  6 Aug 2026 20:42:37 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 676KgZCW3374722;
	Thu, 6 Aug 2026 16:42:36 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <anTugcvjragzGpSK@devuan> (message from Alejandro Colomar on
 Thu, 6 Aug 2026 22:31:04 +0200)
Date: Thu, 06 Aug 2026 16:42:35 -0400
Message-ID: <xn33wr3rr8.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93


Alejandro Colomar <alx@kernel.org> writes:
> (I haven't tested; I've written it in the mail editor directly)

The placement of the .PD's is important ;-)

I'll send a v5 with these, you can decide if you like them or not.

