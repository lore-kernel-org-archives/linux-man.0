Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775372;
	b=BYoNM8smpx4gWIea/QuPxeH8TnhB8dpXQZ9Ed5HlxpBOX0tr3p8CXiaglv4ELAZ0+1a2
	 niPIKZ+/uWpvvpQ0w0PmD5O+iH1GvHbjeXbgZtIVHTqXzmIO38sEcj3+y9W+Vd8wXFUyq
	 LUbG+blkliTngAkYDscCP2Nuhp+AN2UTvm3HvVMLNOscnIIddcgmeMpkViI5UjDNpYZPA
	 0uvZyTtQWhGuBrLbl6nPzrZTKljiQkbXAwBDgrqSr6JnOOc+S1HQtK0yUAVBc/PSYiz5F
	 xrs5vGXZ/2t9pkALfU2A+zyAFjTD4ER2XvzrukZF4HH8UAi8EZ/1mhwsUmHbJEf9i5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=JXkqVELCS4iKLLiloXNq9xeAh8mcm8T9ORGOrA32j7Y=;
	b=GBMJXKhe/HhKvrGJSDyS9yvMKx9LnMEZXeIHptrCT3MzKnF2JpJZFbnnwhXAnyyGCs6k
	 b0vzJ5DEyShK/NeuEz0PkgVAQitpg50TlRppa6OeJd5Trn19EKDE5LKeBP68vR819B/6l
	 vk0wToOAB+46awAFUh9DWCQFFddUR9LAJJEaNlblK39o2no4YN2AIDZVmPpu+5Nu3hxcP
	 vfNe2SE33QKBRzDAaf2EYbWkNYJpunaEHctSKHfscRfMl08lCkygIAFgBtZLWXTl3/oN5
	 MRavMtja/521ctoNELqxsFHEnm3r6BqVOayTwqMKjeSvbKifPG/v4EvKehvj3Pg3asg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="KM/e69hb";
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980DB606A327
	for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 17:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 980DB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KM/e69hb
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfaa3fa12so1631208f8f.0
        for <linux-man@vger.kernel.org>; Fri, 23 Oct 2026 10:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792775370; x=1793380170; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JXkqVELCS4iKLLiloXNq9xeAh8mcm8T9ORGOrA32j7Y=;
        b=KM/e69hbgw+Yv8WkpwZGWj9dhvireaXxKiUL6Eib5HNuf2/ZCP4FWoB6LG6adWNWw4
         xFC3eSpwDR03f3Y00QQz/tL1MnWpwKEliAwuC4UQ2kK66OZ/tOpwjtCvhE/cGa8xaZ2l
         uyF/CwahCqlXJ2tDH1Z5Wa0wN4H9/L4FunuF76oHpyNMhF5/e+I/EkP5YZXk+2gwQWWD
         A0XC3ZoXNIz2gPwNrjzJ65NvhzLI3rJrs48FfBw3GMt84c8Txwd/fYJGuBT6mdiwRql7
         7nQLNwlTSx5c4bNcxUHcRvZCvPuIL3QT0g9eVmz+D1AJwzBsKTmPj3XxJXacwqDILaYI
         FMfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775370; x=1793380170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JXkqVELCS4iKLLiloXNq9xeAh8mcm8T9ORGOrA32j7Y=;
        b=sm9+rYrgLHJhsBe05jgn36pkWAdDbPwi1kqA8G0oNOC+4fXlncsMQhGePpxGdD3v81
         bonGeDX+Fe02w2yjpC1Jb1kFsOkAteVbd/A2haGp92G6CDGy7R2W0IPj6cGvDFGCVYgR
         shgDpwvjBMR802U792mtYly06mHkv5+xIBz2dmP5Mbf8e3VJYkqEbOcmORZeDx+6s7+O
         UTUKZJuhGkHqklOCOkWn63VEgryHDhLBeFw6CbjOtwejsAn7PbUtBaVjyg5gMdNzX+Ra
         iebcteyLaG5CxercsTCyzm0PTMbRKojvXJznJZAVxOPul9vEvb2/aonpwSRY+fmJp4yx
         J8/w==
X-Gm-Message-State: AFq9FYIlqEtlEkg1S4hOwPEBYYdg4pQRJZ7K24/pXoQYLfkjb+Z6kyzM
	NHyOU4o41CDbsvJQ1ieZdlrtzBu79qW1qVSP2Q9oUNRJ0ZNIBLA1vjUY
X-Gm-Gg: AYBFou09r/yjsbK/ce4n+6tTpaAvfGzM7xxI6bCHEGV2c8BSGCTHuLhX9VmqiVjCRQw
	WRH/9tAtODb8PjIrJtO0X8BZr4WSnY9oQMVE69wgzC54mpL8lxLhkGYSZRR51263Sr+xZComqyg
	sF1nyM6AuZsfZ51XzuMnc9F8Dit7vw1tp8yUw8qvpFD2mDjrhRoZFzN+C17C1czB960FEmRvXQY
	KozP4hriWm+beYQhd+qBWpFKxcZ5b3wPcDHNit77vA/dX2wVsleLl1AL44vTsDaiNEVbfhBHMy0
	272akJJOiSl0acdpa3gs5B6CY2z2cADgtvvCD20eN0oL0jAEU2Yg+7r6o4ftSdxGMMP7UekKLu7
	/VEcZQ9w+9l5Qj9MLp8VRYSiWDVRLWZNINqBgG3m8lIRrfRLTQcgHX/6+OHUPGlglm4+wWjwas8
	eRnatUHbiIr6x9ACkKWFFqriMn7wcElpPiP8X9hxZD1s9jSb4UegcXxbc8EVZm2YjqVhpt9DuYX
	6B1xNVtkSuZ32TkdTvaI8+j/ikE+kQtj5xZ56Q7a9N5eFnS/jxI3v/p3YIx74L1+Uq7iLnCJGbH
	/XXcgcMYjpBm6ZRQau2ZBa/foA==
X-Received: by 2002:a05:600c:5909:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a211c78441mr37432405e9.11.1792775369557;
        Fri, 23 Oct 2026 10:09:29 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a29cdb8401sm19586505e9.10.2026.10.23.10.09.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:09:28 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:09:26 +0200
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org, Michael Kerrisk <mtk.manpages@gmail.com>,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: Re: [PATCH 2/7] man/man7/unix.7: Multiple same-typed SCM_* messages
 may be sent in one message
Message-ID: <20261023.23c5bcea7fc6@gnoack.org>
References: <20261021212256.27961-1-gnoack3000@gmail.com>
 <20261021212256.27961-3-gnoack3000@gmail.com>
 <atp-nJT72YOgvnw4@debian>
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
In-Reply-To: <atp-nJT72YOgvnw4@debian>

Hello Alejandro!

On Thu, Oct 22, 2026 at 11:28:12PM +0200, Alejandro Colomar wrote:
> > Date: 2026-10-21 23:22:51+0200
> > From: Günther Noack <gnoack3000@gmail.com>
> >
> > Verified in Linux kernel code:
> 
> I think 'verified' in a commit message seems inappropriate.  It should
> describe, rather than verify, and the verification would come only from
> the review tags.  Maybe say something like "Relevant kernel code:".

Good point, replaced.  I'll double check the other commits as well.


> > __scm_send() in linux.git net/core/scm.c walks all control messages
> > in a loop like this:
> > 
> > 	for_each_cmsghdr(cmsg, msg) {
> > 		// ...
> > 		switch (cmsg->cmsg_type)
> > 		{
> > 		case SCM_RIGHTS:
> > 			// Append(!) file descriptors
> > 			// up to the SCM_MAX_FD limit
> > 			break;
> > 		case SCM_CREDENTIALS:
> > 			// Replace previously set credentials
> 
> Since these are your comments, and not actual comments in the source
> code (are they yours, or from the LLM?), I'd format them clearly as
> such using invalid code rather than comments:
> 
> 			... replace previously set credentials ...

Done.

Yes, I transcribed the source code by hand here, including these
comments.

> > 			break;
> > 		default:
> > 			goto error;
> > 		}
> > 	}
> > 
> > So it is possible to pass multiple SCM_* messages -- they will compose
> > if possible and override the previous value if not.  Since their
> > contents are being conflated that way, they will appear as one message
> > again on the receiving side.
> > 
> > Keep the recommendation as portability advice, and describe the Linux
> > behavior.
> > 
> > Fixes: 5b5cb1958062 (2018-07-10; "unix.7: When sending ancillary data, only one item of each type may be sent")
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     The factual analysis in the commit message is correct.
> >     
> >     I kept the LLM phrasing; it did not seem overly wordy to me and the
> >     style is in line with the paragraph after it, which also documents
> >     Linux-only vs. portable APIs that way.
> > 
> >  man/man7/unix.7 | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 0d2ea8bda2ae..a1dce8c47246 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -543,7 +543,24 @@ option must be enabled on the socket (see above).
> >  .P
> >  When sending ancillary data with
> >  .BR sendmsg (2),
> > -only one item of each of the above types may be included in the sent message.
> > +portable applications should include
> > +only one item of each of the above types in the sent message.
> > +On Linux,
> > +if several
> > +.B SCM_RIGHTS
> > +items are included,
> > +their file descriptors are combined into a single list,
> > +to which the
> > +.B SCM_MAX_FD
> > +limit applies as a whole,
> > +and the receiver gets them in a single
> > +.B SCM_RIGHTS
> > +item;
> > +if several
> > +.B SCM_CREDENTIALS
> > +items are included,
> > +each of them is checked,
> > +and the last one takes effect.
> 
> Is 'takes effect' appropriate?  I think 'is sent' might be more
> appropriate, right?  There's nothing taking effect, I think (but I'm not
> an expert in SCM_* stuff).

You are right, "takes effect" is maybe too much described from the
angle of the implementation - I replaced it with "is sent".

What's happening is that the sender process specifies the "struct
ucred", which contains a pid, uid and gid in the SCM_CREDENTIALS
control message.  When the kernel deals with these, it *checks* that
they are valid (they describe the sending process *OR* the sending
process is privileged and can send what it wants).  Only the last of
these SCM_CREDENTIALS messages survives that processing though and the
receiving process then only sees that last one.

Thanks for the review!
–Günther
