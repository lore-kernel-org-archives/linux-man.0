Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258963368BA
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 20:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785788494; cv=none; b=Np/7k9UBufPPDiCFsEJSp4FljTm3LMgRxsBAv0J/VMpSlSokyj79wD03Vlk5kQ6zhAZnF4pMX+nGsDT6BLodyTcG0bhx0fZfsd8A+mx1LuJd/jRSM8az1KastIo1rv5oCom65bWE2uamb+cWjRI932NZ9yJjLrkuUEcRom4lrbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785788494; c=relaxed/simple;
	bh=QpzuKZJZSLBTc83Etlruw/4LQno0cPmo2pROx1Ow2hI=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=l2rfIor5TvxHmoSBCd8/4oI2QFzSgwXt4Q2nae+EFE9tQmLt3BTG8s8rqP7SVEnFlxdhByM0GUU1G45+EQz3ltVu6YPgZxzo4/co+0jD4bEfGpW2Ag+IdYHn1+tjkAPhk1GNvRE5E6CPqdzjWjBSVe5D1RU3/JE/VqMxOF+TlzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Bb3cyRoH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Bb3cyRoH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785788492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=wDYFRhO9DY0Bj7YAGeHSVpUAO2stcGCRigotROIXbb0=;
	b=Bb3cyRoHclzQaoVs/TLFoTJQDzQVI+jSs7WmYg/PI/d4FFP2OVHBaE6Bshz2/zX2BTjdGS
	ERf4q0DysdSdOjRwvouxqW9YtJFOBA8lypoDTcMunDKfh8IwWzsANDT8gzAhCaYs5hf7KK
	v1w7Lk6DzmsLyT9M/+4qbXjKAnr3o04=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-42-5Yr3i-k_NtyTvAJheNThZw-1; Mon,
 03 Aug 2026 16:21:17 -0400
X-MC-Unique: 5Yr3i-k_NtyTvAJheNThZw-1
X-Mimecast-MFC-AGG-ID: 5Yr3i-k_NtyTvAJheNThZw_1785788476
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E06D19560AB;
	Mon,  3 Aug 2026 20:21:16 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.88.221])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3C90A1800480;
	Mon,  3 Aug 2026 20:21:16 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 673JQN0v3318598;
	Mon, 3 Aug 2026 15:26:24 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org
Subject: Re: [PATCH v3 2/4] man/man5/tunables.conf: Document system-wide
 tunables config
In-Reply-To: <am1GD8EYQqLBrXCT@devuan> (message from Alejandro Colomar on
 Sat, 1 Aug 2026 03:13:01 +0200)
Date: Mon, 03 Aug 2026 15:26:23 -0400
Message-ID: <xn33wv57kw.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Alejandro Colomar <alx@kernel.org> writes:
> '-' should be escaped: '\-'

Fixed.

> Also, these examples don't need bold.  We use bold to differentiate from
> program output, when we have examples that show both a command and its
> output.  In this case, being just a simple command, it's fine in roman.
>
> 	ld.so \-\-list\-tunables

Fixed.

> For consistency with patch 1/4, this should use the same wording:
>
> 	The syntax allows lines to start with the keyword
> 	.B include
> 	followed by a
> 	.BR glob (7)
> 	pattern.
>
> It's also much simpler.

Fixed.  I thought I got all of those in sync...

>> +The file is parsed by
>> +.BR \%ldconfig (8)
>> +and the results stored in
>> +.IR /etc/ld.so.cache .
>
> In patch 1/4 (ld.so.conf(5)), this paragraph is specified above the
> specification of 'include'.  We should be consistent.  Do you prefer it
> above in both, or below in both?

I moved it here.

> (I haven't pushed patch 1 yet, so if you want to modify it, I can amend
>  it.)

Well, you did push it ;-)

I added a signed-off-by to the new 2/4 but I've never had to do that due
to Red Hat's blanket copyright assignments everywhere.  Assuming those
are in place for man-pages, I was under the impression that a
signed-off-by would be contra-indicated.

