Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B49E230264
	for <linux-man@vger.kernel.org>; Fri,  7 Aug 2026 03:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786073390; cv=none; b=tnCaUg3NpWG9F6yycvt8492SHN7ERm9efG1FJrm30HEoecTGslKjFdE47xRVDoc6lEwFGhfkLdugJa2O8v/ErxrzDzbZek8lnmmKlojXJ2i8bSTafJjXrZbnjgPxHyGywFZP81h/mx8T0lOkjZQwrKxftvOEGKyNfVr3k2gnGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786073390; c=relaxed/simple;
	bh=mYdilAoBHcEJIRPJquVbAwAdWf1214x/db5J30qzqC0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=eImHtmrBHt26Umav7TFz9brh8+knVZarXh9sqRYj3+aLcERvUAxskey7zJS3+/ludUHQEEX9ytaaZCNQb9nH4oPrTNNmI+pLQdfrvD9KltXONjPqTq3WQU2MhsHrwNo3Qo7o1xhB8qDnYxy0wX/0V9qtdEMWvDkX8jzqVJUH8jU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NXuzEV7Z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NXuzEV7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786073388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=scugQyX7lAZphVHUq27Z7+LjcBITG+GLIl7wgpD25qQ=;
	b=NXuzEV7ZXM2mbHE/oeNlyQRxcKjdrrtD4HLXjczLR6Yl8OVzuUWdDuB5RNMkotqw8l8bpK
	xa3AhJDGsUgnnNDcbaXDNXWUgG6MqahNLelI8/1WJB2sfzckK0BxGzqZnlH4idEMpBfSTV
	KBKzUvgPjeInPG2n531WqrvBh+X+BGY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-pWqs91mrOuuQejxAmuHV_g-1; Thu,
 06 Aug 2026 23:29:46 -0400
X-MC-Unique: pWqs91mrOuuQejxAmuHV_g-1
X-Mimecast-MFC-AGG-ID: pWqs91mrOuuQejxAmuHV_g_1786073385
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BE3471800145;
	Fri,  7 Aug 2026 03:29:45 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DA62426;
	Fri,  7 Aug 2026 03:29:45 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 6773Thnk3389801;
	Thu, 6 Aug 2026 23:29:43 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <20260807021256.pwzsls7awqmbslti@illithid>
 (g.branden.robinson@gmail.com)
Date: Thu, 06 Aug 2026 23:29:43 -0400
Message-ID: <xnqzka38wo.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95


The problem I had with .PD placement was not the compactness of the list
itself, but the inter-line spacing between the list and
previous/following paragraphs.  You just have to know to put the .PDs
before the paragraphs that come after the space you want to affect:

.P
normal paragraph
.P
* list item
.PD 0
.P
* list item
.P
* list item
.P
* list item
.PD
.P
normal paragraph

My HTML background had me put the first .PD before the first list item,
which bunched the list up against the previous paragraph.

