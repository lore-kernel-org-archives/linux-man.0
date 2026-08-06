Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38D377550
	for <linux-man@vger.kernel.org>; Thu,  6 Aug 2026 23:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786058116; cv=none; b=PRmiGa2X6VR/tpB8NRH+3epZd8tI0BGSVKOkdHc2FgVIPmt+w74i1w0CeC4tFYI6s+rlSq8Jb3CG6xShwg498JlJGlOxGhDX9EqlRSqdzrNwGtDMMfXv4KlJxuHRppW2PUblft3wpWp6uxQfS3FNNj8q3PmF08k9v+t3OYMNIs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786058116; c=relaxed/simple;
	bh=1yDsR1CZ+aF/Tn0h5zWZno9f3Y86FsGWiDO0djUkMTc=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=d+p2yGJCH9vA/UkDob5cQ/2ls7eFmLgfiVKLs+plJsFB2M1ltSqxogwi3FwiKBSlilTHKyW7h8ge3rx4LaodH73ZOR+B5dXRDhzRSGHoISx7aAj1hLeMMKP2LJqMr1+xyCrkjC+S6UAWFCOVM30DzGHOx/wq3Wg4xZqhKqL2Fok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DN9yJVdG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DN9yJVdG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786058113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=YJ2l8cIFqlTS1RR4W/qyEPJU1Sgl+ANKipRHzpS1LdE=;
	b=DN9yJVdGFmQAvVoO4W9nF/NBovlCPNUbNWSgEtC7z6PCHhZ3tkHVe+ePLq6xs5C7ESJiOO
	DEuF8ydTxu2U72qUD1tdpNhqSboOiCoczbiX33Kwh6xYcoqIyvEWm+MhkqDbTwdkDwyn5q
	n+ivjFlAadmoHj+Vg+ySYDb5H7in/aI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-uwzd7JLyPt6DV0KhxQv0Fg-1; Thu,
 06 Aug 2026 19:14:54 -0400
X-MC-Unique: uwzd7JLyPt6DV0KhxQv0Fg-1
X-Mimecast-MFC-AGG-ID: uwzd7JLyPt6DV0KhxQv0Fg_1786058093
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 48764195608D;
	Thu,  6 Aug 2026 23:14:53 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.120])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 01A731800347;
	Thu,  6 Aug 2026 23:14:52 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 676MFFoA3378278;
	Thu, 6 Aug 2026 18:15:15 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <anUAwb8lY_u7eU3F@devuan> (message from Alejandro Colomar on
 Fri, 7 Aug 2026 00:02:47 +0200)
Date: Thu, 06 Aug 2026 18:15:15 -0400
Message-ID: <xnwlu23ngs.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Alejandro Colomar <alx@kernel.org> writes:
> You forgot to sign.

I will never remember that... :-P

>> +The resulting data is read when a new process is created by
>> +.IR ld.so .
>
> Sorry for noticing this in v4; I forgot about it.  I see this unresolved
> issue from earlier versions remains.

A program is a file on disk.  A process is a running memory image.

Neither fork() nor exec() cause the tunables to be loaded, the process
itself has to do that.  For dynamic ELF programs/processes built with
glibc, ld.so does it before it passes control to the ELF image.  There
are other types of programs/processes that do not use ld.so and thus do
not read the tunables cache (which is called "ld.so.cache" for a reason ;-)

I don't know how to say this clearly with fewer words...

>> +The syntax allows lines to start with the keyword
>> +.I include
>
> s/I/B/  (since it's a literal, not a variable)

Fixed.

