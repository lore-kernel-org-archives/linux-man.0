Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D564248C3
	for <linux-man@vger.kernel.org>; Wed, 15 Jul 2026 18:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784139606; cv=none; b=HxdobxjQnDtLbdqyC0jIyDiBaCYPJNnp+6Y3dPooSDc/Ez/xdw/9cGCu0JuziXY3omSljeZXPjRnMvAPJALYnW8wPiIG3aAVzt5oRuRFscTbYIpVNHKyp834kWvnPjJJEjkuspUawCVSiMTrTlfP3rAGNjLcMPNeM7RybViUinU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784139606; c=relaxed/simple;
	bh=dRvXpYVYhXzQEzXNY3QuVfUFURSNdGZCIhn9DxiQFGE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=i67WAEpHzMEGuoRwmCYoOmot5186zn9nBeYWPmvT8iEaRXOZka3IIhfTSxrFPF//MO7dqFW3oWT7MC2MgkNvtiKoKYQKnKapliulYQaocQSQwf4BVlUEyzMDIqEcsrUOL9TpShKfypdfS6/DdOWBWn2J2LcGeWKiXiFr6rGuyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dikM9XvA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dikM9XvA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784139600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to; bh=Qsp71Int2yHTjMC59rHDhe25JFNmH4PI2gh9k9W+xcw=;
	b=dikM9XvAP6xGhQa69hXevHJXeyJgjLj/DZC441M7Fs2REspQPu/Enc8lDfbEgFUwYEhcqe
	WXCwwCOpRIunsaO2enYbZfagHlp/q8muoJhxe4cW2m4iKzakcNn+NiwbQX3lnhF+6RmJ6M
	Hg8G9OrHL/Y7LBZHZd+zguHyrX6xd9E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-61-KiM-IXj2PbmxMYzX0ZUzHA-1; Wed,
 15 Jul 2026 14:19:52 -0400
X-MC-Unique: KiM-IXj2PbmxMYzX0ZUzHA-1
X-Mimecast-MFC-AGG-ID: KiM-IXj2PbmxMYzX0ZUzHA_1784139591
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 474FD180064E;
	Wed, 15 Jul 2026 18:19:51 +0000 (UTC)
Received: from greed.delorie.com (unknown [10.22.89.250])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 04BBA1954107;
	Wed, 15 Jul 2026 18:19:50 +0000 (UTC)
Received: from greed.delorie.com.redhat.com (localhost [127.0.0.1])
	by greed.delorie.com (8.16.1/8.16.1) with ESMTP id 66FIJnMi1173049;
	Wed, 15 Jul 2026 14:19:49 -0400
From: DJ Delorie <dj@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
Cc: alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: man/man8/ldconfig.8: document system-wide tunables
In-Reply-To: <20260715165450.iakjkw6qwgcnpzq7@illithid>
 (g.branden.robinson@gmail.com)
Date: Wed, 15 Jul 2026 14:19:49 -0400
Message-ID: <xnqzl46rp6.fsf@greed.delorie.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17


"G. Branden Robinson" <g.branden.robinson@gmail.com> writes:
> The man(7) package doesn't impose a rigid stylesheet on its output.

Perhaps, but the fact that I now know about the rule, and the exception,
means that it's not entirely flexible either ;-)

> The only alternative I know of to not exhaustively cataloging every type
> of "thing" one might use to compose a man page is to write down rules
> governing the usage of a smaller lexicon, which itself is necessarily
> semantically "loose", and thus frequently derided as "presentational".

In this case, it does sound like the man pages need a different thing
for "example code" (.EX) and "preformatted text" (html's <PRE>).  Or we
need some magic for known types of .SH like SYNOPSIS which are almost
always rendered differently than other sections.

> There is, potentially, a _third_ option, which I mentioned in my earlier
> email.  As I said, literally no one expressed interest.
>
> https://lore.kernel.org/linux-man/xno6ge8p38.fsf@greed.delorie.com/T/#m9fda91ba28ca257c67d4595f81d38b32c5c9c937

glibc uses texinfo, which is TeX but terminals don't have **** off ;-)

I think of texinfo as a "TeX compiler".  I don't write programs in
assembly either (well, usually ;).

I've always advocated for "whatever system means the docs are stored and
edited with the code, that I can turn into whatever I need."  Roff,
html, texinfo, markup, whatever.  I know how to write converters.  DJGPP
had a rule about "every .c must have a .txh" where the .txh was a
texinfo snippet, and these had meta-info in them so the tools knew where
to put them in the manual.  gEDA's pcb had a "comments in code become
manual" system that used a short perl script to merge everything.  Etc.

Yes, I know why the man pages are separate.  I've advocated for the
glibc project to maintain its man pages along with the sources that
affect them, but it's easier to just have glibc developers be man page
contributors too.  I wrote the tunables docs a long time ago, but had to
hold back the patch until I knew which release would have the code
changes, so they would stay in sync.

> It's the sort of thing I'd try out were I on a mission to eradicate `in`
> request usage from the man-pages project's documents, but I have no such
> mission.

Nor do I, but I wondered if there was a programmatic way to automate
this so that the authors don't need to worry about it.  My general rule
is "the third time you repeat something, automate it."  I still don't
have a robot lawn mower, though ;-)

>> Now I wonder if the problem case is predictable enough to have the
>> preprocessor *know* when .EX needs the .in +4n, and when it doesn't...
>
> What preprocessor?

Whatever "sed" scripts we run in the Makefiles, that's all.  Currently
they just fill in the .TH data.

> As I understand it, one of Alex's objectives, as was Michael's before,
> is to keep the files in the man/man* directories directly renderable
> with "man -l".

I agree with that!

I just think we could relax the "and must be formatted exactly as a
release" a bit, in exchange for making it easier to contribute by
removing one or two rules the contributors need to know.

But that assumes that it's (1) purely cosmetic, and (2) automatable.  I
note that "man" formats according to the window's width, so even the
official tools don't honor the "and formatted exactly as" rule.

(wait, when did "man -l" happen?  Have I been missing that all along?
Is my script really that old?)

