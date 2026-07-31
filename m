Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F5525F7B9
	for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 23:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785540506; cv=none; b=a9smalgZiUQfr1uBRDkMLJMGMpwd7qvUWbOtEMYIu/29updGtgoKlsZAl+TJcpEhR4WaJ6yYLaB7crEKhMzaOW3Y2OP6FGK8RRhQuWaqMwK3Z//USsNDCOPddxv+WJatwSOL+zqAT0AWUOke9dOitja4n8gdcu3qE5mocnJkqKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785540506; c=relaxed/simple;
	bh=C3kG4ZOyEbVI3J3BAIME1r0bvq6pVbLm31MKrNACJQ0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=abOZMJLBGYg7LVA0hAEEtWAn1T0HZ3CEz5IBETo+bsqtw4h8A5p2Smcxh0DY2WaY9ZDH6xZwyeDM9enEBGHvcy2kKo/Gfyy8QJAZTH6RMMDtd7yVb6KPqYJGSf6+y8vq3Og9RNOAPupN5gtPkpZYMmJ2vneA73XnajnqpWFQZ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f8Lt44G1; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fbvuqZux; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f8Lt44G1";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fbvuqZux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785540504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/v18rK2fdcERtiTg7cOb+m4J6dWMxnZM1hjgRKLD+f4=;
	b=f8Lt44G1VMKOIKA5/et+YywAAC93ggEPin2SPvpOrYjkzDtZNl1zmfUIGOjxjroX9LYI8O
	mnvE+vNSbKLQvXj7MXB5BFOLx1II5/0aGTLsQT3QgNDGhEnbNi1Wgtz4vYL+NotP18wt1j
	hFzqUEOmYwmIyczF6tHju89WKbNUPsA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-eEl1xzlxOx-w8AZpFBYsrQ-1; Fri, 31 Jul 2026 19:28:22 -0400
X-MC-Unique: eEl1xzlxOx-w8AZpFBYsrQ-1
X-Mimecast-MFC-AGG-ID: eEl1xzlxOx-w8AZpFBYsrQ_1785540502
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-47f835ac1aeso1258195f8f.3
        for <linux-man@vger.kernel.org>; Fri, 31 Jul 2026 16:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785540501; x=1786145301; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/v18rK2fdcERtiTg7cOb+m4J6dWMxnZM1hjgRKLD+f4=;
        b=fbvuqZuxCoP0mrEk3UK1wZvGop58700+ngVOXz9+OIqGY8B24EcAN5i3swYnTHeyBc
         ZFJ71qWr9VUTfOJWkq6Nkculsav4xWWm7OPd44EI7S4ngidmgkkHVxDy/gUDpWydR5+H
         jhPaeX2xqA7M+CU0pfsYwgLCs/hF7xSPJnArpfJwqhejyYnhfqFwJXoaI63QiwQ2kJ8b
         Up9bERgL4xf9F57nYSWqBuH/EadZbTmKzOTyQR5xWyqCgkDnnyHR5FxhDLmaRUHC82zR
         U0Yp9bnbnQGGFiNOGMNUpjcoS1zrPd3owD6KGtGGo7hcnwZwXVcEOVv9va+bb7a/cnok
         sh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785540501; x=1786145301;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/v18rK2fdcERtiTg7cOb+m4J6dWMxnZM1hjgRKLD+f4=;
        b=i1XbA7+z3XcWTvKQnkGo4fKitPR/xlhdlkfrTO7dNZIyAT4qQpTptOTLEhZid1wL8B
         xG3s/OVDqdBR1TEafdpnqxjGxmk9Yt0qXeqV6AHeFU22jl8OpHX0FhkaHUUBg6WASEcb
         pyhrMleuPNi26XVQnDTZXSIqkjUGJv0VgH/EWK6b4Vmj71ASZmd4M8tOY8iL/vkn8TxV
         6RiUcsBNIJfZyYAPKp1CyOX8gvhssW3BR1qOnAHPWRA9zhDfPRkqIZ9BReNC+KKpxsNb
         3kBCiX8woWGz+0442/oP8PBOBIleFyC6/oT1L+06vqlX9Nr5jk8Y2bwfC2laTdUWV7J4
         NY1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoKCXBHZe7HNqtfO7Yu3uU2LzKNNlTXLlpGMpkkAEuUOKacx4EoatA86zQAjP7AMieUca2N5tr768=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmfoTOkTYTv+3j6SYrIg2RzyurZlpEp3T1nVJE9Uz0BFafKNYW
	mCaNHSmV9VZtYB5SR/kB9SJoV5BnVH5H4yRk5Tn9Gf+dXVVrwo/AZSwqt6tOa55bvdpDKhU3aCa
	0toP0bbMEm+DETZZU1ed/SqaEpFdV2ZH2TirlgnNnQlX/57ehXy+Qfa34QGWJoA==
X-Gm-Gg: AR+sD10XebVWFJvBZzS5B+MglnrTP0eKWkY1/29piciN8pBZ3tCYceTDO71LmeLE78E
	IHVkGrj9vuuoJUSLUE8mf3MXtWTSllngmLX6ftkEFy4ACRWxaHgsLnf+zSgKrVk6y2fx5t3qm/S
	QQUzhavwEEkPvZ5VKTbnVcDKq3py9So1vJIjf3yIxfR28iCrK331p+YJICpENQx4TqBUB4kLMCr
	RFDFmrUlU4qtaQK07lvW0GJtzxsMe1ehuAXeTjQoQzItaQLPCn6jz3h8rQl+wVn/FJzyMx4p9YY
	S86GsypZuOqGg80F/VtceJca161iFu4gQtTLDXkWKtFrdvoiPA8gGar6VR22P/aMFVNwvC8uBEt
	djpqS2FHxZSypGi6QwFcHKpVPiaz2xLM=
X-Received: by 2002:a05:600c:48a2:b0:496:bba5:33a7 with SMTP id 5b1f17b1804b1-4980c6824e7mr898225e9.27.1785540501555;
        Fri, 31 Jul 2026 16:28:21 -0700 (PDT)
X-Received: by 2002:a05:600c:48a2:b0:496:bba5:33a7 with SMTP id 5b1f17b1804b1-4980c6824e7mr897955e9.27.1785540501246;
        Fri, 31 Jul 2026 16:28:21 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ccbsm2887755e9.3.2026.07.31.16.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 16:28:20 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wpweJ-00000003J7c-2tgM;
	Fri, 31 Jul 2026 23:28:19 +0000
Date: Fri, 31 Jul 2026 23:28:19 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, 
    Keith Bostic <keith@bostic.com>, Mark Harris <mark.hsj@gmail.com>, 
    Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org
Subject: Re: [PATCH 1/2] man/man3/{mem,strn}*(): SYNOPSIS, STANDARDS: Document
 these as provided by <memory.h>
In-Reply-To: <20260731230847.prx4gay3ejvqdy6q@illithid>
Message-ID: <8b8fc216-8c6e-fcc2-c72a-2c26555d95e7@redhat.com>
References: <cover.1785532392.git.alx@kernel.org> <784288e704183a4297aeaa3d13af8edab18bc1ea.1785532392.git.alx@kernel.org> <e1031c2c-37eb-3cee-8bf0-f3285803d4e3@redhat.com> <20260731215122.4p4aepsbgeoibx74@illithid> <89c9b877-54a8-6a7c-016d-51e4be210ad6@redhat.com>
 <am0fnb4BMRrTajqx@devuan> <0407bda3-c03a-93cb-9400-5fb8256a30f2@redhat.com> <20260731230847.prx4gay3ejvqdy6q@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 31 Jul 2026, G. Branden Robinson wrote:

> Occasionally, matters get relitigated because they had been wrongly
> decided.  I appreciate the trend since 2000 or so of Stroustrup (with

That's a plausible description of Alejandro's attempt to relitigate 
realloc with size 0, in order to reduce UB.  (Although in that case I 
think there have simply been too many changes, and so the semantics are 
irremediably confused regardless of any subsequent standard changes, and 
the best solution would involve a new function with a different name.)

I don't think it's a reasonable description for what are essentially 
stylistic matters, for anything as widely used as the header in which 
memcpy is declared or the NULL macro.  That's in "would have spelt creat 
with an e" territory - things that could have been better with hindsight 
but where the cost outweighs any possible benefit at this stage in the 
language's life.  "Avoiding UB" or "real user confusion" (in the case of 
strn*) are much better arguments than "slightly unaesthetic classification 
of functions into headers".

And I consider it an abuse of position to change man-pages to declare to 
users in general of C libraries on GNU/Linux that your standards proposal, 
at a very early stage (not even an N-document), is the One True Way of 
using the functions.  It would be more neutral to say in the man pages 
that "as of July 2026, one member of WG14 has proposed moving these 
functions to <memory.h> [reference]; this proposal has not yet been 
considered by WG14".  (I doubt the utility to users of describing proposed 
changes in man-pages at such an early stage, especially since the 
information would be long obsolete by the time those revisions of the 
pages make it into distributions, but it would at least more accurately 
reflect reality, and be vaguely neutral as long as you do it for 
*everyone's* open proposals, *including those you personally disagree 
with*, rather than privileging your own.)

-- 
Joseph S. Myers
josmyers@redhat.com

