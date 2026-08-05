Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277B3191F91
	for <linux-man@vger.kernel.org>; Wed,  5 Aug 2026 14:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941440; cv=none; b=P8R5e8Vo5t2M7FQKZobxXXqWWaHNBgHCi9bqZ621RG5KgY9kl+4+78h+AicCacgpXof2ri/EH+MmDdLlOVoPkaS+aUS7Uam4HJRCHdY3uLwWjL4CKwIN/QiYSn4QGZA1qFGOXOG4Vr3Zx1U9bhQrkqxtDI0+S9+30R5FCos0fSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941440; c=relaxed/simple;
	bh=5tUMuTXl689fh8Y1KwqeaHlBscWeFyY3xCDm+l3lwEY=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=g52k3mLQ43usQE6GLk90tjL2jBM9fE6rJzy8Y/JPeUZaSLggFRmclHNSfeHCpd6zW6Gui0C+Hv4WfJdqHcCmxjiBZ3iNg1BdI+x2WdbxMXzM/5kfNTd3lBl4s7+y+8EdPdIM3zpZ/x4EM4nhpCDjTdq8Qi3jvX3z2Doz0k2Z4mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XIEWZPh5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XIEWZPh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785941438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
	bh=WF9XzVegF3ugJCzN6GtUFNgan6oxETqMKhrQP6IfTHk=;
	b=XIEWZPh5cvmdqEsi+KZF3HqYvqUvzkqdwQJ6k1Bur4vADhllypjJXhi2WGGXk96hNdWYYo
	DLS8GONr6upoe7IQvjHj4O8GWu6DfrX46bjDhTEV1yEIPOV+IRKW7bkZ07+GA591DPoQSW
	+gWHajw0pkfsDsxt+52MRcjSSqYuSmY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-587-thCFHfnqN4-5T5o0gHNI8g-1; Wed,
 05 Aug 2026 10:50:34 -0400
X-MC-Unique: thCFHfnqN4-5T5o0gHNI8g-1
X-Mimecast-MFC-AGG-ID: thCFHfnqN4-5T5o0gHNI8g_1785941433
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E44DF19560AE;
	Wed,  5 Aug 2026 14:50:32 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.27])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BA6F195DF92;
	Wed,  5 Aug 2026 14:50:32 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 675EoUTV1730261;
	Wed, 5 Aug 2026 10:50:30 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, libc-alpha@sourceware.org
Subject: Re: The goal of the Linux man-pages project
In-Reply-To: <anNBLjQj8-Eg1TUf@devuan> (message from Alejandro Colomar on
 Wed, 5 Aug 2026 16:15:07 +0200)
Date: Wed, 05 Aug 2026 10:50:30 -0400
Message-ID: <xnik5o4o5l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Alejandro Colomar <alx@kernel.org> writes:
> 	SYNOPSIS
> 	     #include <string.h>  // see memory.h(3head)

This belongs in either SEE ALSO or FILES.

> 	STANDARDS
> 	     BSD.
>
> 	     These functions are also provided in <string.h>, as speci=E2=80=90
> 	     fied by ISO C.

Ok so far

>	     This is a historic mistake maintained  for
> 	     compatibility  reasons.   Don=E2=80=99t  let  that fool you; these
> 	     functions don=E2=80=99t necessarily operate on strings.

This just doesn't fit, it's far too opinionated and personal.  It needs
to be more neutral and standards-respecting.

  "Historically, this file contained memory-related functions, while
  string.h contained string-related functions, but currently these
  functions are all in string.h, despite these not being string
  functions, and typically memory.h just includes string.h for
  compatibility across all the historic standards."

I'm not arguing against the message here, just the tone.

As for the message...

I think the only way we could be more persuasive is if we convinced the
standards committees to actually segregate string and memory functions
in the specifications, and tell you to ("shall") include string.h or
memory.h accordingly, but that would break a lot of programs if it was
actually required ("must").

As an interim step, we could get the standards to specify string.h for
string functions and memory.h for memory functions ("should"), knowing
that either include gives you both, and at a later date (after all the
software is migrated) change to "shall" and start encouraging providers
to actually segregate them.  Or offer a #define that strictly separates
them to aid in migration, such as we do with other api-breaking
standards changes.

