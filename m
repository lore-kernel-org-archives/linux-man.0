Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3013D8907
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 20:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786047463; cv=none; b=LOt2xMIERXQtbOp5NT31dqzWc8PSJ3SdbxsyuSzkfTvtLz7DyEpPq3H64r99opCATnaqvxxMcX3UEbCkoIJeTXQ9FwG5XW8M4Pz17ykNA1Ybdljq0X/1aM21Amsm41oFhlF3LGzA6xfLbVmHnkRcH8TudyWI8aV/uGNBgOYtWAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786047463; c=relaxed/simple;
	bh=qptZ4Od2Uiwg1wpXPfL8njQdnZ9vbcQKnbeX9CqwXL0=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=UvfKHm2BeaCug57S+shHHQrVRsgHSNqLWtc0irvqWRb1HU4oj4nCNIpyW8tW+l9H19SW9v91WNkGrdtvW+YG6nFS4L+PNedydKEeBF2WH4XNJuE/bVZoiI5INS81Cz2TeIde0UJ9OV7IsUggDK+TVVCD+ly+dWbKkMo5xJ/n6EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fxhqD/l6; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fxhqD/l6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786047461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=IerZMMklBDmqJlelB9lPrL3dUaKN7WpcpNsCHRJLoyM=;
	b=fxhqD/l6NRfQbqyy3mb2Xei10fDVAo4XUFw6UgAVuSNqE4jwQZ9eTXmutVkyhsdcDhIgrh
	/4VVHy8N/zMvGVCwhsmjYekWKQ4cf8wubL/9bB4wOdtexPSRIxKs/umVNnwk3+g+aZuynB
	sPyr4VN4E94zNDXr5MKAiwsDoK7cfuo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-8uq5PJF4NV2pGdIMZ7WOGA-1; Thu,
 06 Aug 2026 16:17:39 -0400
X-MC-Unique: 8uq5PJF4NV2pGdIMZ7WOGA-1
X-Mimecast-MFC-AGG-ID: 8uq5PJF4NV2pGdIMZ7WOGA_1786047459
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E31C6180064C;
	Thu,  6 Aug 2026 20:17:38 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A1B75195DF93;
	Thu,  6 Aug 2026 20:17:38 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 676KHafU3373490;
	Thu, 6 Aug 2026 16:17:37 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v4 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <anTZdJDceYtD7Rfj@devuan> (message from Alejandro Colomar on
 Thu, 6 Aug 2026 21:14:28 +0200)
Date: Thu, 06 Aug 2026 16:17:36 -0400
Message-ID: <xn5x1n3swv.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Alejandro Colomar <alx@kernel.org> writes:

> Hmmmm, let's see.  I couldn't do it in five words, but how about this
> schematic approach?
>
> 	The file may also contain
> 	.IR filters ,
> 	which limit the tunables following it,
> 	The effects of a filter are terminated by
> 	any of the following:
> 	.IP \[bu] 3
> 	The end of the file.
> 	.IP \[bu]
> 	The end of an included file.
> 	.IP \[bu]
> 	An
> 	.B include
> 	directive.
> 	.IP \[bu]
> 	A new (possibly empty) filter.

I like it as-is, other than "why are there blank lines" but I don't care
about that ;-)

> Since a filter can be empty, we should document that.  If we document
> that 'filter:pattern' is optional, it'd be [[filter:pattern]] (with the
> appropriate formatting differences: the inner '[' wouldn't be bold).
> However, that's likely to be confusing, so let's document that
> separately:
>
> 	A filter can also be empty:
> 	.BR [] .
> 	Such a filter has no effects.

Done.  I put it after the filter list, so the "also" made sense.

