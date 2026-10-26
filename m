Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793048350;
	b=R4FVnMgdu0qjP1xKyOLsnMKEvOh+oWQJ761J1oHwmrFlJHzG9zJG/Rvf+RkjtZX/otVm
	 sNtzfHHcIgsb7YN9NgqTPTlIsgQiJz6LPt2p8tek10g2bSk19xKnkhUeLdEGTqAHYp14u
	 Ln3suwFinWONpJ3D6IUhuqB4CDmHh6DpMisIzZ16ViBFRjMy6S0H3ZVmwTXEdpmsntc/c
	 U0l7YTNX83zm6COpkSkLHksv+CmSkpQxWFeqN72PrWQUucW+8Sx+uP7rwNyt1DG4Bc3iQ
	 4hGZNGkOdiaKezwKt5fcfnVkUbeMQIjsvwzwF0XY+WrCMkVMTJ/Fa2QrUB2rJDSHbcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793048350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=BHbf7TX0BnluLd4rgc1Oj8rqso841YkjTRfmWKacLDc=;
	b=hC5y/23KVoEiQavl1y3hHUoJDRKRsPJOJPErrsV/f0yvUA1uro7Ul8LMGa+yOO8cNdJT
	 kZ4Dvi9Nm4H8zU1siA8QzTduFcgqIXZABSMWPnbtUKmfx+/2CfIXUpRZjI2TRWeq4sirV
	 RmHe9xyfYb7XIAuToVWarvZkY877WYKVrJRlum/75p54hdPMQe20u8CxuuN/RCLgQsrp4
	 pvfwS7+yw0qm0NoL17gl6N6Jj6Ut6G+1YlEyHxaq8kiv8+liWCJjQtuwhV0ishF8YaFNd
	 tFhzcmjNYswJVxgQZlcZq70uhpC92jOQ0XOA8FWqQaqGDTrdOq5uKtk69vdqi26LCLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAh4TKIl;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4AC606A31A
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 20:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B4AC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mAh4TKIl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so14767905e9.0
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 13:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793048348; x=1793653148; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHbf7TX0BnluLd4rgc1Oj8rqso841YkjTRfmWKacLDc=;
        b=mAh4TKIlgDuVW3wWNIcCi3T9X8dE8s8ABZFHrh7FAl1CbtV23Zs/Bvey6p2Hs5Hn3a
         PNWkcrgFgBUbdres6By1Debb4oCbYEneNfkWL8NVGWMrhXwYds+uK8pRriYyAJtPisO/
         znf3cDjxuS6YKJurBJh0fGgu53cVeRM0bIc5uSCYrbgtNr+jt3Na+gtm8LzmPD5/BWde
         bpWiPcTpM7QnhkteV6eye417pXIqGSIftrYglWUo90YXoL2C+lE62f8CwwDdK9QfbeoM
         HHLZRiOw19SOsLtB9pDr9Pjdnih6cU1qtlxLO6ZckUiYUYUIUhQsiSaQHM0VX6zr8hHT
         zNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793048348; x=1793653148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BHbf7TX0BnluLd4rgc1Oj8rqso841YkjTRfmWKacLDc=;
        b=IKWibvwRtDz5FvI8ju/fIBVY3cUFx3DAwxdll0sx/dbCdFsr8I0VQOZEMEPfM9dUGA
         PpMhARxC2U6YeNv634SKcafv3mfkyptA55hNzlta+070Zwm79f3AquPFPJYJp9UcpsNy
         qMKU5xKaW/Cge4O51IRSCO9rpDB+iVHNJxfBVNWYWA6NybfIrXrFYjpnNeXO0+WgIRE8
         bp9MvyFph0YMJP3yfG3RgCSD3uwBLWm3GR9yYZE+MgLTfXAuonFVu8pvnXDzthMWHHqX
         PDQRADIgVH81Oc/scVsnZPap6zLJY9MYmibe+fu0pxrpd+rpbjA+QFZjlez2/5Y7vCsl
         8+7g==
X-Forwarded-Encrypted: i=1; AKwUvBxx2ylYDLDovxsefykG7hERZH698DyJcs7ZPFPqhS2O82v3ic6xvzHVE/xxfw+wkcGuCvJUsm493Ug=@vger.kernel.org
X-Gm-Message-State: AFq9FYIO3Y6EM7WOFo036H1gRQCzbdnPEplBEDdCIXDydlP57kpL7LVt
	tjO3aq9fAZnp4rfHWN8uwrk6HXDTCXyXWbmMoZSXy26Q3qTt6eQloUoW
X-Gm-Gg: AYBFou2hzG+YsOANLn88CrvOwNj0OdDc4nW+maDmGdTTYuQrp/AfiW/pMUderR8Zw4t
	ptuRpn5AGhxZI2jFIQMYCR+0rW9gbStr38VxU5qGjztscV3aPtWzcNz74cO+aTAjla9xHExOgWn
	PeybqZCHXbxw3RyDnBgBZA+8n7Q8cmvJRoHDV4k6vrrgSZo2zr6FmtiEkVnYgN78SazJSZEWlrD
	x/3w2meTyJpel57nhqsfxA5hbp8k3NFQ6/MB2u5bUODX29VLk8sd3gSqE9AqvPL8B3sUPhGFeip
	t09RKINFASYmtCBSkOhuqA+0Q6meutvlDj87lLsTjL2WDcd1qUKfv/no7Tv6XJSWA7vIyPNBZLt
	k5PCD3GKnvwvrK9x1Tul5fCgSK11PnjuOCUgE4Tw5u3uf8AAJkgaPuw58NaOckkB4ROjtSwINcN
	37KGXuwaPUPcTN/8IHBF+Tu3BnWkncssaX4+pNhulXWiKDivSHretxax/HiedYUSYwGWWgsQUOb
	ZrDnOXzGVo7C/BiD1bSJ2aAxJFGFfUeuGofbX3S26aCn+xn1tGpqhHi2cBy+mjm2H+lwGyLvTiE
	939m5A==
X-Received: by 2002:a05:600c:190b:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4a50d0b6418mr110583925e9.33.1793048348292;
        Mon, 26 Oct 2026 13:59:08 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48eesm18565989f8f.30.2026.10.26.13.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:59:07 -0700 (PDT)
Date: Mon, 26 Oct 2026 21:59:06 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 3/8] man/man7/unix.7: SIOCINQ: Document behavior for
 SOCK_SEQPACKET
Message-ID: <20261026.f82eccbbab40@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-5-gnoack3000@gmail.com>
 <atxCMPCa1YAcOLTq@google.com>
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
In-Reply-To: <atxCMPCa1YAcOLTq@google.com>

On Sat, Oct 24, 2026 at 05:34:00AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:07:55 +0200, Günther Noack wrote:
> > Document the SIOCINQ behavior for SOCK_SEQPACKET,
> > which sums up the lengths of all messages in the receive queue.
> > 
> > Restructure sentence order, so that socket type differences are
> > discussed in on paragraph, and commonalities in the next.
> > 
> > For reference, the SIOCINQ lookup is implemented in
> > unix_inq_len() in linux.git net/unix/af_unix.c.
> > 
> > This function first rejects SIOCINQ for listening sockets with
> > -EINVAL, then does a case analysis for the three types of Unix Domain
> > Sockets:
> > 
> > For SOCK_STREAM, the result is:
> > 
> > 	return READ_ONCE(unix_sk(sk)->inq_len);
> > 
> > For SOCK_SEQPACKET, the result is calculated using:
> > 
> > 	skb_queue_walk(&sk->sk_receive_queue, skb)
> >         	amount += unix_skb_len(skb);
> > 
> > For SOCK_DGRAM, the result is:
> > 
> > 	skb = skb_peek(&sk->sk_receive_queue);
> > 	if (skb)
> > 		amount = skb->len;
> > 
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     I double checked this all in the code, and quoted the code.  Both the
> >     commit message and commit body were substantially edited based on the
> >     initial LLM-based version.  (Nevertheless, I would have likely missed
> >     the inaccuracy if the LLM hadn't found it.)
> >     
> >     The LLM initially just slapped an additional sentence into the
> >     paragraph, but that was mixing the socket-type-specific concerns with
> >     the general description -- I split that paragraph apart so that we
> >     have one paragraph for the three socket types and one for the
> >     socket-type-independent description.
> > 
> >  man/man7/unix.7 | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index d0c1765dfd79..4c46b54206a5 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -606,6 +606,19 @@ can be:
> >  For
> >  .B SOCK_STREAM
> 
> and SOCK_SEQPACKET

OK fair.  This was explained a bit below, but maybe too close to the
implementation.  When I initially looked at this, I found it a bit
surprising that for SOCK_SEQPACKET, it returns the size of all of them
combined, but for SOCK_DGRAM only the size of the next one.

I'll conflate this as you suggested into "For SOCK_STREAM and
SOCK_SEQPACKET..." (dropping the other sentence about SOCK_SEQPACKET.)


> >  sockets, this call returns the number of unread bytes in the receive buffer.
> > +For
> > +.B SOCK_DGRAM
> > +sockets,
> > +the returned value is the same as
> > +for Internet domain datagram sockets;
> > +see
> > +.BR udp (7).
> 
> Simply say it's the length of the first datagram.
> so that we don't need to jump to udp doc.

Sounds good, it now reads:

  For SOCK_DGRAM sockets, this call returns the size of the next
  pending datagram, or 0 when no datagram is pending.

(Using the same wording as udp(7))

> > +For
> > +.B SOCK_SEQPACKET
> > +sockets,
> > +this call returns the total number of bytes
> > +in all messages queued in the receive buffer.
> > +.IP

(Dropped this part as discussed above)

–Günther
