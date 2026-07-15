Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6BC238C36
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126047; cv=none; b=q5M85kWXzUxBAtVH4ts87VtAZuzPuKK5ecT+T/oKcbzVPNpCy7jrgcfoT4C3KoD9pj1koW/1DVW4jnXKeDqTvj2+VUFcvKryZ4SGqUNUVn8JBJXig81JQduMEkw6SmOpmdBsUF+cpyyU1fLVDsT8eTqq5AJCGgEhRPAnPxPCjFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126047; c=relaxed/simple;
	bh=OqrJF3Ou2/AcmiyC2G+irONmRTomagpbGL/fDHHQMF8=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=qZCbILX3EmUQbuRCvoEqaQZ9eeI325+OWKvB62Mqkcizea1YWWBXywzAWPxtYSlO8laav4bDNVoqU2G820SNcXNLIFMlCLOacL+wia/qIHD1DiOCx6D4c06+Sc9hCFwJdKTULWx6sx6rit2MIMuVFYBPhAh6PgcUcYwXem+KwYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FfoSnCZ8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FfoSnCZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784126044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=KbBMuAHy5WU6Z9DKDVumQHkPCd+dED7nUwFtBtGLRCo=;
	b=FfoSnCZ87d01cF81Sc3CSXEG0dUrlHYFw1QtTABGVM6RLtJ9GH1U/015XpM35Z5dZmrdGT
	i/kqaGXnhKriOmWQsHVHYGFVDy8pJiu0xMvlh1OE84BC/S5wjo1wZb2jPzxvbkOkcSLFB0
	yui7Pc4z+YWz2WKntEI24tw9dWrZXeE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-588-EMWVS_pvOp2n3Az2FYk5Og-1; Wed,
 15 Jul 2026 10:34:01 -0400
X-MC-Unique: EMWVS_pvOp2n3Az2FYk5Og-1
X-Mimecast-MFC-AGG-ID: EMWVS_pvOp2n3Az2FYk5Og_1784126040
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04ED21956062;
	Wed, 15 Jul 2026 14:34:00 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B703E180029F;
	Wed, 15 Jul 2026 14:33:59 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66FEXw8t1163388;
	Wed, 15 Jul 2026 10:33:58 -0400
From: DJ Delorie <dj@redhat.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: g.branden.robinson@gmail.com, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <aldxiBVva99diG5t@devuan> (message from Alejandro Colomar on
 Wed, 15 Jul 2026 14:47:25 +0200)
Date: Wed, 15 Jul 2026 10:33:58 -0400
Message-ID: <xnwluw725l.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Alejandro Colomar <alx@kernel.org> writes:
>> Add the .in macros around .EX there?
>
> But we'd need to know where to add them.  There are cases of EX/EE that
> don't need to be surrounded by '.in'

Ok, now you have a new rule that's even easier to not know about :-P

> Also, the manual pages should be readable in the form they exist in the
> repository

Not a problem here, a different indentation doesn't affect readability.

> (and match as much as possible how it will render when
> installed).

Er, close?  ;-)

Is ".in +4n" the default for .EX, unless the user changed it?  I wonder
how often that case comes up.  I wonder because I would need to review
an example of the problem to figure out how to search for it ;-)

Now I wonder if the problem case is predictable enough to have the
preprocessor *know* when .EX needs the .in +4n, and when it doesn't...

> That makes it easy to see if a change works, by running man(1) on the
> source code.

Yup, I have my own lman script that acts like man(1) but takes a
filename instead of a man page reference, finds it in the tree, and
formats it with underscores, italics, bold, *and* color!

Perhaps such a helper could be included in the git repo, just for
authors?

>> and two .EX's that do not have a closing .EE.
>> Turns out Gemini is good at perl.
>
> Please don't use LLMs for contributing to this project.

None of the patches I've sent include anything AI-generated, nor would I
attempt such a thing without disclosure, because I understand and agree
with the legal and quality issues of AI-generated output.  However, I
won't not use AI to help me understand the problems I'm trying to solve,
or optimize any diagnosing I need to do.  My time is too precious to be
stupid on purpose.

What I did was tell Gemini what I was looking for, and it wrote a perl
script faster than I could open my editor.  Cut, paste, run, throw it
away.  That was just for the statistics, of course.  If we added a
preprocessor script to the build itself, then (1) I wouldn't use AI, and
(2) it would be sed instead of perl anyway, to avoid another dependency.

Ok, now I looked for it, and we *already* use a perl script to
preprocess the files, in scripts/mk/build/pdf/book/prepare.pl.  (this
just means perl is not a new dependency, so we *could* use perl instead
of sed)

> The file "CONTRIBUTING.d/ai" contains our guidelines for their use,
> which essentially says it's not allowed.

glibc is the same way, I'm used to that.

However, glibc decided that it has no place dictating how the user uses
AI *outside* of creating the patch itself.  Yes, that includes linters,
analyzers, and perl scripts that generate statistics so I can understand
what I'm working on.

I refuse to follow any policy that tells me what my morals should be in
the privacy of my own home.

