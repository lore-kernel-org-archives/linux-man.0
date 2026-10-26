Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050071;
	b=hIQYS/ylbNXlCf2VfRNH+Lq/DyRppsSCiPMsSQfhNDmLnFEWH83M4YIV20JSOLf8emcy
	 sIe4hQuPPjZERdpje1u6IdeSWdFs4s3qWNqvinMMxdfp0FCdaWKg2WgjuE5VM0V7wEkMJ
	 nEMlbBFqBWcIt4Rddnm/T1ZB5ABsacQPr7z9mvmsXsszgXkgKasrlsE4fSczqLpTwWnMs
	 81F08p8xzRLCFmAMtrqCrpYLF8PHk16vDQ8i9f+YRywug50KXsGDM0nMPCqMBrRkD8M5A
	 x2UQyU9a7g+heKYA7bEMA6sksVMUZMWhmg86SW1O7Ct9/JIK2EtDHtBaBrKc7XFCG+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=hfpovLNkxwxTMgBOjzL9u9OgNhpprhyEBNqKlubiMWQ=;
	b=oQE9YpzwTqPLfMH/q3H+ULJXgFQzbDAf2D0JgX95qS544Ru3P6o1WQjZ/LA3B3D26Lc4
	 CIeEdT++FXz4N4FSn3I9pgJXQuUn6ok5Rk0qvp57ISbEEDhatBveGH91b9CZw129PQzxt
	 ALznJMEN/jLuY7rM2ZOY6TQFhP+KLHn3rm8uXv6TU+g0n0WyiZW5c1T5ZN0Y9PiZWH42O
	 mjUYac3+P2Rrqsvd+7IKAgDqfIzyGlpNkwXw5Oa8a24jIuO1dDwq8NQzg8k6w+emac2RS
	 bzJVNGHU8zUzbn+2Mn8bwGvqOiwEmZ8jhEEMOdvmOzr9acxcikrODii1+o4JgR91Y7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gkgaimBV;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A81606A31A
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1A81606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gkgaimBV
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2218084f8f.0
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 14:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793050069; x=1793654869; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfpovLNkxwxTMgBOjzL9u9OgNhpprhyEBNqKlubiMWQ=;
        b=gkgaimBVukac0RK2nxzs3q2ghiGdGsIcSjHov/+Vn+HbNaYAKb5P/wrmrkqBenWAoz
         ya11VloAkRJoVwlx1/+dbz4/xsf8IY4v8SPARM0qKZd/HiSti1kt2bQ7OpW4HSfs1Ytb
         rzwnbh91LzgUgfiOJY5g2Fo1oufdmLC9h9F5JqKLh9wNFYSj6rX1JUn/+yLIuQq/g0Ky
         XKsCSP4fvbJN1VkfIAAQ/Xdb9yzgWAAgkJfwHSZjdVJZNkVL+ewZ4SPOu8DuVAT7Sq6K
         PX8V66QQCeyFXuGfT7nWtLwbT4uoT5obokmzXwcjmTZ4v+rGkQRVMOh8Z6RJwFwWdV+5
         X5Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050069; x=1793654869;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hfpovLNkxwxTMgBOjzL9u9OgNhpprhyEBNqKlubiMWQ=;
        b=WEtvrmIbdsDHMJYDXFHsDb9CeeLNrBVi2o8D/DlXd2G83Ax+pcgZYHhy0eFcdQL4an
         yAZic7Vdz9bAFWD87DDaVZnFmtJKIuKX+Fuzp1IEn8vQW7y6SvPG56SX8rODwPy9ZS41
         56v5yLN3Lu9t6/coEoh7wobXfNRjm0K5TZ7fNnCtizmHjjj3dxRPJ58HY7PYCywTN0va
         2Bnvda3U8rRakxXuQcI0yb7iLkr8fwfAnbpRdhpz2GYNeD7pRfxtE6VVXG2vkK8mbWq2
         eaEjdoA75KW9+/nhxCZJ00eMyD108ud8VhEZwJA8zdIdWT5hfe8FKkeUC+isOSUrOExr
         xy9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/pF5wwdY7IR7rmFLVCpAN1muDyYUl4ozxcxHYQxf5IaRMBpxTo7qPVqDQow5jOLex+D4pnSLaJ2o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrqpR3xYpIqAMz6mFswgGv2hH54B3EKOoSE0aurvsI2yNq3l16
	dciuGPiJvYPPdeAJ/fJS2jlVxjDyinMtc0UIywmJolzbQV+Ed72T/emQGwaQWoqv
X-Gm-Gg: AYBFou1zBMKEYbKgxsqvtNQfkdlK0WYFIzqFjsBV655y/wF4U+WKR664RmR4+Q10axO
	4CpW7TkHzjPxcrmZ5VK4d+Z4b4/5vmSzi9t6YXMhIImS2fyswGHqJ4mJAeiVmSLWE+CPUeURX1m
	O6fDkpHdwliM84UGGh5Zsi/TrP912Mo6d/E6PEQrZ7DJuRflt4loRVff3/nhtc823s0fhFrifs0
	EKE9YMvVG/9ISiDC72cKqYqi6rBv+sO7s0NQBb02QPrMbeGJu1rAN2lO75gbaAL8Mv0V06RiD6G
	kzWq3dhoD4N6fd53t8AymT6GYPx7JM0e4aIsM2Tc46ZUFuU2z1C2ZxribyDSi+EJt3Hw76ZegTX
	1ULF1sY6AtWN+DBg4ehkMz+smp8DvstuSeCPq4EyvhA+uRMmFBiTvAxITJwFtVgG736+fKOFISA
	ZZK8OGcDnxkyKRM369qWw4iYRzhp5uGGnsQLNRiH8RFM5QUqWxwz+NA1WfcDRQ17GD6W5ZeYnRS
	1wTw/ElmmskO4jHgWhVPx9MJK3+ynIWCS7vVCQm8an64qF8ZMm/JCTd7+wUF3bj4iolSVBQO8RA
	1CmuBQ==
X-Received: by 2002:adf:e906:0:b0:487:baa:aa6b with SMTP id ffacd0b85a97d-48e3eb9c276mr10892691f8f.43.1793050068766;
        Mon, 26 Oct 2026 14:27:48 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f248sm18096539f8f.6.2026.10.26.14.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:27:48 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:27:47 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 8/8] man/man7/unix.7: ERRORS: Document EACCES, EAGAIN,
 EMSGSIZE, ENOSPC, and EPERM
Message-ID: <20261026.0b7f6cd5c7f8@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-10-gnoack3000@gmail.com>
 <atxJNMgN8oadDlDZ@google.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <atxJNMgN8oadDlDZ@google.com>

Thanks for the review!

On Sat, Oct 24, 2026 at 06:03:02AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:08:00 +0200, Günther Noack wrote:
> > These are all returned directly from linux.git net/unix/af_unix.c:
> > 
> > EACCES
> > 	unix_find_bsd() checks path_permission(&path, MAY_WRITE) on the
> > 	socket file of the remote address.  The rule was already described
> > 	in prose, but the error was not listed.
> > 
> > EAGAIN
> > 	unix_stream_connect() returns -EAGAIN when the listener's backlog
> > 	is full and the socket is nonblocking (there is no EINPROGRESS for
> > 	AF_UNIX).  unix_dgram_sendmsg() returns -EAGAIN when the receiver's
> > 	queue is full and the send would block.
> > 
> > EMSGSIZE
> > 	unix_dgram_sendmsg() fails if 'len > sk->sk_sndbuf - 32'.  This is
> > 	the limit described in "Sockets API".
> > 
> > ENOSPC
> > 	unix_autobind() fails when all 2^20 autobind names are taken.
> > 
> > EPERM
> > 	unix_dgram_connect() and unix_dgram_sendmsg() fail if
> > 	!unix_may_send(), that is, if the target datagram socket is
> > 	connected to a socket other than the caller's.
> > 
> > 	This is not something that the remote end normally does,
> > 	but it's a possible corner case.
> > 
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     Verified in code.  Kept LLM wording, which seemed OK.
> >     
> >     Remark:
> >     
> >     The case where the remote end is connected to a different socket is
> >     obscure, but still possible with Unix Domain Sockets, when a program
> >     first bind(2)s to a name, and then connect(2)s to another name.  Then
> >     that socket can be discovered by another process through the bound
> >     name, but sending a dgram fails if the sender is not the one that that
> >     socket has connected to.
> > 
> >  man/man7/unix.7 | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 054f1af75dd5..79198445c581 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -655,10 +655,25 @@ defined in
> >  .\" and it may well change, probably best not to document this now.
> >  .SH ERRORS
> >  .TP
> > +.B EACCES
> > +The caller does not have write permission on the socket file
> 
> If we align with other doc, "write permission is denied..."

Done.

(IIRC, the man pages have similar, but inconsistent, wording for this,
but this is the shorter variant.)


> > +specified as the remote address to
> > +.BR connect (2)
> > +or
> > +.BR sendto (2)
> > +(see "Pathname socket ownership and permissions", above).
> > +.TP
> >  .B EADDRINUSE
> >  The specified local address is already in use or the filesystem socket
> >  object already exists.
> 
> s/filesystem socket object/file/
> 
> Two sockets can have the same address once one's file
> is removed even without closing the socket.

Sounds good, changed it to "file"; I guess it does not matter what
kind of file is preexisting under the desired name.

–Günther
