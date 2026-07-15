Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2131AA797
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 20:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784148414; cv=none; b=lXYL2ivzz3ZaqdFeXK7P/QMKDry+skvLHnoVZQvRL8F0WRBMstjVIF9b7rbaNUH9n6QSGKNx3M7jIM8dg/mWuxBA+eObyMf7IwIMBKVSJgqACxIupzEfU0YAQrnd3CV3xe2eXSKebj9d43NnEfyI1QIv7BzpK8cpV9herC50gnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784148414; c=relaxed/simple;
	bh=4fCiHT6yyImZGAXfoL62CexHgJQz5M8l1R6rrGdnV+g=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=D3w4oqZTzZXcwp8veKL+BuFV3/4HRbccSjkGDGgWPNyz6WYG534U4ZZmmyRPcymIxvdbytj0JxZYho2cmWMAKqkaIW3OVn9Nzw9U1VCeRKFe/Uz+cEEXbPIATqYUeyq+aqkFe6oKhZpggfqyjAFjbPujnJOegwoMAGPGrCp1sH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jCcTUJQq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jCcTUJQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784148411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=M1hx0bc0D2BIfF4Uk59UGFynfqr8YRbHvIRw3iDjwpA=;
	b=jCcTUJQqT7tU3CJWGunSg6izXptWRzvYTWNJoKIBhYHTbA/fyMHxSc8PC9YH6R3AsQWMRq
	ZdFZpNlpD3pVj3li8jwtZoTlbOQ1OY4sdweTTXmG8zozfqAWIP8nH0L6QDHBUOnRPpkOiE
	el8eTI/QAT25a76y5TM1pGe8dzmOLc0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-330-Kwzn_e63NnexjH7TikhI6w-1; Wed,
 15 Jul 2026 16:46:49 -0400
X-MC-Unique: Kwzn_e63NnexjH7TikhI6w-1
X-Mimecast-MFC-AGG-ID: Kwzn_e63NnexjH7TikhI6w_1784148408
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51E171955DC3;
	Wed, 15 Jul 2026 20:46:48 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0489E1956087;
	Wed, 15 Jul 2026 20:46:47 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66FKkkAh1178474;
	Wed, 15 Jul 2026 16:46:46 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <20260715194711.mcdsgtt4x37cwdum@illithid>
 (g.branden.robinson@gmail.com)
Date: Wed, 15 Jul 2026 16:46:46 -0400
Message-ID: <xnldbc6kw9.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
>> > The man(7) package doesn't impose a rigid stylesheet on its output.
>> 
>> Perhaps, but the fact that I now know about the rule, and the
>> exception, means that it's not entirely flexible either ;-)
>
> The man(7) macro language is not highly flexible, no,

Sorry, I meant the man-pages style guide rules, not roff itself.

>> In this case, it does sound like the man pages need a different thing
>> for "example code" (.EX) and "preformatted text" (html's <PRE>).
>
> A common error is to assume that `EX` implies `<PRE>`.  It doesn't.

I just meant for semantic context, like "this is a code snippet" vs "I
want this to be formatted the way I typed it."  Might be helpful when
outputting HTML/CSS, like the examples would be in boxes and shaded with
the usual "copy to paste buffer" button, but <pre> would just be
monospaced and unformatted.  But thus is the slippery slope that led to
XML, and we don't want that again.

>> glibc uses texinfo, which is TeX but terminals don't have **** off ;-)
>
> Yes.  And info(1) sometimes produces...intriguing results.

My preference here is PDF, as we make sure all the cross refs and TOC
work correctly, and it formats very nicely (duh, TeX).  Info is useful
in emacs only because my fingers are already on the keyboard.

>> I don't write programs in assembly either (well, usually ;).
>
> No indeed.  The real "assembly language" of troff is its
> "device-independent output", which for short I call "trout" if it's
> Kernighan's original spec from CSTR #97 in 1982, or "grout" if it
> features groff's extensions.

I've been accused of abusing my own namespace here.  I would have called
my version "djrout".

> Yes, but people get _really wedded_ to the specifics of rendering even
> after setting aside the huge issue of terminal width.

I once worked for a guy who, at one point, wrote a typesetter that went
between satellites and the New York Times.  The typesetting had to be
perfect, every time, and run at line speed.  I learned a lot from him,
and he's the reason I have my own copy of the Chicago Manual of Style
and know what Reverse Boustrophedon is.

Also, Team Oxford Comma!

>> (wait, when did "man -l" happen?  Have I been missing that all along?
>> Is my script really that old?)
>
> In the man-db implementation of man(1), it seems to date back to _at
> least_ 2002, as I see a Git commit for it (imported from CVS or

I might predate even that.

> If you are/were using Red Hat/RPM-based systems, you may have been using
> Brouwer/Lucifredi man(1), which as far as I know never implemented this
> `-l` option.  After that implementation lay moribund for many years,

RHEL 9 has "man -l" via man.man-db at least, but that's today.

