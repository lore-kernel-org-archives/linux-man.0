Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049120;
	b=kny9/6EtQZWy/7tzLgKMeu9S7lpdDHURfDEG6RcY80IRivZICIjPAvz38hhYlmu5uirS
	 A/eBQyyA39KgAEN5AaD+/89Y/XRmpiMakc/m11WbIP95bHoGuavkfseY1X6qWo1DE6lcA
	 VZhimdOMJkOvmRnp+uG6cyDxdoruYQVZMAK1wifrrV44dy1oee40KWyxMHB0H3ArvraPB
	 4AMOiLkjeKAlcET0NhhOHbE00PWgMbCrkvC/1MqMpHeCYSeuvVbEke7x0C2xZNZfWQT9e
	 0EuLM13r3b08jVjBq3FggHC0sir52QLjgwQWMN8LkvRI3jLVqclBajTDvpC9fNHhHcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=p1VbqTWXsjM4TKR1aZffATUfrE4PCTVOOuVqZI50RP4=;
	b=luuYShu/SatNgc1EdrWmvU1LoWn+3hCob90w0/Lm/jcpQbxMrlw+IXBeLaHj8R1kfQZ8
	 fI87QZkJLDNZsRQbSABOQEiahyQ56n6X9Kqkgi7UpNrgAWY12yBSQrCL2BT3zMOhBX8+O
	 DUoGBKmSD2mdbPPCqf7xjxY5kmOG/oHTf3y2jda7Lctfnw5S71ytLw9+9Hlk/u1AkQk+B
	 VORbZ5z1nDCARRqV0K9lVcYXavxMMj1r99nfkEWalXD6RTRqN/Pb5XaTne9LQkFbcOpMb
	 mlOZDXYHBRgz2u0rcWLZr5VqWyHLEh8/QjIckHlKltYMbj5s+OsVXcTXf7C50/M1/8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eqeYumwu;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECEA606A31A
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AECEA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eqeYumwu
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so22418945e9.3
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049118; x=1793653918; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=p1VbqTWXsjM4TKR1aZffATUfrE4PCTVOOuVqZI50RP4=;
        b=eqeYumwuR7lyrTbfbioqZfYM42Pt1MmbQM8avzI9YczwgeQmUvEHjRT/iEFkliztli
         sWqM/Y6gpI2QRZQWVQ8Y8WNMM3g6tIzScAGyL74sh5o3IT57lFyzgFv2BdlPrJ1k5NTX
         dmrmHsf4xaaVQ3SEZ/x02INqty31cc0umA8ecl6UGudbpejiOikTlFLinjnomgwYrB6w
         WJc0od9r7fQR+3T6T4ze+BaqdScAIcF1TG1KiyOY4Uh4UqrrLji2xaw9/olU5iQkjpqS
         /93eVykol/H85RFANsJO+FWuRYrG/pw7otDzHxGaK/1d4vQUYzcJUA3pEJ886baJ+wLi
         3a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049118; x=1793653918;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p1VbqTWXsjM4TKR1aZffATUfrE4PCTVOOuVqZI50RP4=;
        b=dpQ1hO5+pDmuyHa6Hg4LOklBNmAIWPiVYoCEhVOAa+SXnWTe0gXJ372IKcg6VZpfcJ
         amFQlaE7CKHCIoWflBI2ts1L7PHL15idMJkryzvYXWnF6nqXIaj56eeazRaZnfwH2wDe
         In/5KDwbJgBvqvOZ4fJvTN3gBqxq4mWXsZDbvGKrMlIE3QA3F0Pq1dnZwlmofcbsCv0K
         xeVwRS2AlQXfmSJRbaZ2AjFi302WnB6tcugIJCJycZGQSBN/+EzrvJ/WsOMLFLsBs4yN
         9ghBbhcScQCtivg1FaceC1Au4p4OnA0WON1uQ2zJ/CXcPJ6JWW4Xaf9a8+jSx79nVcJU
         Y6Nw==
X-Forwarded-Encrypted: i=1; AKwUvByaTENeevjHUeC2QHtH+PO5VDGuc91RFJXYFLBBoMCGu7jDR0tKd1fu1A5pKVQKh+6OE9rujJ+iPGE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgCGWqWzXI66oNEyhPwGeTCWLKTcjERr0lOqtTcgSA/qpME79X
	V1eN+H9QTTPWMY6qHOSbez+/I+1M1sFEeZqd5VkAzTCwIiFRPviDFdRoLcmumGAq
X-Gm-Gg: AYBFou0tm1UtsC0Tk6wjpOC+EBPjRh9UEkg2XqsdGIcQL32PmDXnIRCZ/fXxS6lY+LB
	yjBbOewo76J/qrj1zq6yU4lNyN4O1Bh9549tnutaYCxDIvXKyiMXTm0Xc988g5V4M7uXj21vcrf
	rjdCzNSWO2+vNPbl0TIhJStjEyXqO94rpogJaD6vyQZZV7cUhFpFolUPiT9iRoJLG3M7BpZeKuz
	ClNn2uRHw2T6hrVipQFLxS1FB3cSRcxsnE3BszZ+Ls7dEWt1JB68nogaDyc90/1VtvS1jq9zRcQ
	k++OKxaRRPk0cr58dbDydwDBnbG5cdxu4gEyMEyACCJbBttIy23iV0xlLwhz682DvUscrVCPWr7
	hZlwXVgE+wzuqofYi32y4DpmrRDMbRYHTY5/Ua5fEcKNaI9xbnrPFst/K/mniGf33er8yASol3c
	GsIzix/Vz0OoAuLEV79inm1LEaHZ1lndwxpc8UJcjXi0wnnHEPc/vNs0Myc2m/43dhlBj+KcRaa
	0kNDbR6rx7Yo8lyM//VkKpU7OaFEa7RvV0xh1p8tc0bZ5RzlxJcRYSKrEqWYymi+7aUKt7JC93D
	LTYP
X-Received: by 2002:a05:600c:4e4b:b0:4a2:e0c:2b0a with SMTP id 5b1f17b1804b1-4a35aca5bd3mr135354715e9.16.1793049117961;
        Mon, 26 Oct 2026 14:11:57 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4d8dsm19900481f8f.36.2026.10.26.14.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:57 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:11:56 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 4/8] man/man7/unix.7: Explain Abstract UDS scoping to the
 network namespace
Message-ID: <20261026.dc0f52217f35@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-6-gnoack3000@gmail.com>
 <atxDa5S8RPeZTm7C@google.com>
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
In-Reply-To: <atxDa5S8RPeZTm7C@google.com>

Hello! Thanks for the review!

On Sat, Oct 24, 2026 at 05:39:52AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:07:56 +0200, Günther Noack wrote:
> > Point out that Abstract Unix Domain Sockets are visible within the
> > current network namespace, unlike Named Unix Domain Sockets, where the
> 
> s/Named/pathname/.
> 
> pathname, unnamed, abstract are used in Address format section.

Thanks, fixed.


> > remote socket is looked up through the mount namespace.
> > 
> > To avoid confusion, remove the word "namespace" from the subsequent
> > paragraph, where it is used in a more colloquial form (there is no
> > abstract socket namespace in the sense of namespaces(7)).
> 
> The change still uses "abstract socket namespace".

In the "Abstract Sockets" section, the word "namespace" is not used
any more in the general sense, but only in the sense of a
setns(2)/namespaces(7) namespace.

There are some places in the man page where the word "namespace" is
still used colloquially, but these are not in the vicinity of this
change and feel less prone to confusion.  Do you think I should update
these all in the same commit?


> > This is already described in network_namespaces(7) as well, but might
> > be mentionworthy here too.
> > 
> > The lookup of Abtract addresses happens in __unix_find_socket_byname()
> > in linux.git net/unix/af_unix.c, where it is looked up in the network
> > namespace (struct net *net) in a hash table in that namespace:
> > 
> > 	sk_for_each(s, &net->unx.table.buckets[hash]) {
> > 		// ...
> > 	}
> > 
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     Verified in code
> > 
> >  man/man7/unix.7 | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/man/man7/unix.7 b/man/man7/unix.7
> > index 4c46b54206a5..232fdbf4c3cd 100644
> > --- a/man/man7/unix.7
> > +++ b/man/man7/unix.7
> > @@ -257,7 +257,17 @@ has no effect on the accessibility of the socket.
> >  Abstract sockets automatically disappear when all open references
> >  to the socket are closed.
> >  .P
> > -The abstract socket namespace is a nonportable Linux extension.
> > +Each network namespace has its own abstract socket namespace (see
> > +.BR network_namespaces (7)):
> 
> Remove this sentence and...
> 
> 
> > +a socket can connect or send to an abstract address
> > +only if the socket bound to that address
> > +is in the same network namespace.
> 
> add "(see network_namespaces (7))" here.

Good idea, that's shorter.


> > +In contrast,
> > +pathname sockets are not confined to a network namespace;
> > +they can be reached from any network namespace
> > +in which the socket file is accessible.
> > +.P
> > +Abstract sockets are a nonportable Linux extension.
> >  .\"
> >  .SS Socket options
> >  For historical reasons, these socket options are specified with a
> > -- 
> > 2.56.0
> > 

Thanks,
–Günther
