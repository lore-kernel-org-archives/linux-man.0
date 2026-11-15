Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.72.114
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776162;
	b=IckB65m7ZP9W+n6eeLXSbe8hUv0xmg1SOFwa5x85LxPaWn9ulGZhknfZUvBb4K7P3bsM
	 6ODIGrFTxY2c8njgS2CvV/rJ71I2ST3+iYdupOziRHwSxwseclV74EYiZyO1L4ZwCXyib
	 T7D8/q9AYZqdnzaYobUSVlYh0Qh2RY7bh7U6Q9a+aOtOqrVu/Ux+kQruGzX/EQfOeu9q7
	 1/W6cJmm/T5C2GAwqpLwA2sA3I5pa0r02MMmHVuob0Pt3SQrzaF3jeMbh1JnQO2soWJCV
	 5USTaWl6Irk57AeasbLR85lBE/Cp9Fj81dywQXUltp99fFjJBxS1FFsdqow5pX5wj8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776162;
	h=DMARC-Filter:Received:Received:Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:CC:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:
	 X-VR-SPAMSTATE:X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=1ZS1M6KKZjNZXvdnBTbIvvXwEK5Mb5xh63FA3EY0urA=;
	b=vN2MJS2peg69azlveD/OsVYnEkNA3G/6tns3xS++Ax1zPsl7BLBSGGOExi3Ta8LZz3q3
	 OMJHW2RZUEcqQCJSjL+Foi8/2nvSuoJkTrOKMmITlpm2rHeB1lmMG7ZMmphwM5IAk+6B4
	 a8r5pLdnUUBndByxu88UkqWX5Ysek8GrS2xX7zjqL9ypGElSelJQRbhQFleB/4IFVi4HC
	 hI1nl9Pd8mDh5xzegxSazJ5v7mIHBZKGjewpS77RfeU+u5ozzZ+jRotkkJOhPBW5C9AAG
	 WXVPnGDp3llhUXdfbEc60XrTitTZVXf8MHXRTNACT9nl3uvSByHhRDRJJhqV+6YAKMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=vHAtJTBh;
	arc=none smtp.remote-ip=46.105.72.114
Received: from 9.mo562.mail-out.ovh.net (9.mo562.mail-out.ovh.net [46.105.72.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FA2606A31F
	for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 20:56:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FA2606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=vHAtJTBh
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net [79.137.60.223])
	by mo562.mail-out.ovh.net (Postfix) with ESMTPS id 4jSNYz5GyQz1ymT;
	Sun, 15 Nov 2026 20:55:51 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net (director3.derp.mail-out.ovh.net. [127.0.0.1])
        by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Sun, 15 Nov 2026 20:55:51 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.111.174.187])
	by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jSNYz3Bpfz1xp1;
	Sun, 15 Nov 2026 20:55:51 +0000 (UTC)
Received: from [10.0.1.3] (88.142.38.18) by DAG5EX1.emp3.local (172.16.2.51)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 21:55:50 +0100
Message-ID: <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
Date: Sun, 15 Nov 2026 21:55:50 +0100
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
To: Alejandro Colomar <alx@kernel.org>, =?UTF-8?Q?G=C3=BCnther_Noack?=
	<gnoack3000@gmail.com>
CC: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
	<linux-man@vger.kernel.org>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
 <20261102233932.29912-2-matthieu@buffet.re>
 <20261106.73089117d0af@gnoack.org> <au8HcBs37d1yUkZ0@debian>
Content-Language: en-US
From: Matthieu Buffet <matthieu@buffet.re>
In-Reply-To: <au8HcBs37d1yUkZ0@debian>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CAS5.emp3.local (172.16.1.5) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1794776151; h=from:to:subject:date;
 bh=1ZS1M6KKZjNZXvdnBTbIvvXwEK5Mb5xh63FA3EY0urA=;
 b=vHAtJTBh4vYNin+/A6SOi4bLbrt7KzS22KWpDDazdpaza9DLzxNi0+9cfg4HVWyuzXfsgEJq/c07GlmrmrZSBys+24nNJzRVMwlE9EzESpXPL6fBIHOrCX4DGsNmXrJnhJugVNJh6FkSUmIs0r7wtbdHOPtOGSMARQ69xZLpgj/wOIPgKl+5yoakhHgTh+axNhSUNAVI8I7kiIZ3q59WLcQv8xhdSlC/hwjYz9vEDDm+HYGvyuV4pvlNnfwVWCwlYHSh4bmJfYEZulAmR7+j9342m9INH8wfHv6wcftJtbtuKJJE8oQnDn3E6QxzOdOcKM5DAjKDLv6PvLj+ML7TIA==
x-ovh-tracer-id: 2042100960189309462
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFTZQXyb+DrSKxc3U+anXhDkTrSfJmXq+02d2Ojma7PFGKDEXpF7heNIO6y3AMUwtwdL+FhOYX9OhPbae6cfv95ogKNmjV/JZRogQxsQjDeJr0us8pUtHXnZ8os6xLmpWvmvcZDnWqTVVwmfYau83aFoNpCz4pyeFMeT2logVU02GNV6ruzMQriXfxegU88o6H7v+2CIAb7cfq++MsgrZqOInnWZlNw7BF3MQ5/F0edvmzzjMhTaNYzHiFBHP9qCFKBL9Fzo/QYU7GRfzq/PFmc1/VoKIrhlP1vw0L6zRovrrKJ7N1uNtqDgDKswRzwpyrV/7OjqRz0wuDDq6A0QTsIiMY8RNiHSaIhZpcieo8Rt9Z8auzwUesi9FHpwciNaxzCb7njS4q2NHQtCc/zLUg9frz7ThHV4NT14w27GLM5PolI7mjf0a/07ZXfwrlwA6U1RHv/gmrUmvhCY5whbqhC8pBbRx6Fc/+3Z38HwCY125I8D0k0o4w8UFNGKhk0fINBOZiWYtg6UmpQnV5uj+EYjLYKao3IWvaeC/ofBjA9nWqU9ZrVKSrN3nkrQtjK1mLS8dUOFkWDSU8laDLAOH2v8G9p9WUlb7tn3cvWUnR4C+TdASsIDJAFqin5lRx9AhTfg9gBcHvspyFuqMruEDDg8zBrGdwJ1viDKiABqiWsCA

Hi Günther, Alejandro,

On 11/6/26 11:02 PM, Günther Noack wrote:
 > On Tue, Nov 03, 2026 at 12:39:32AM +0100, Matthieu Buffet wrote:
 >>   A Landlock rule with port 0
 >>   and the
 >>   .B LANDLOCK_ACCESS_NET_BIND_TCP
 >> -right means that requesting to bind on port 0 is allowed
 >> -and it will automatically translate to binding on the related port 
range.
 >> +or
 >> +.B LANDLOCK_ACCESS_NET_BIND_UDP
 >> +right means that requesting to bind on port 0
 >> +(explicitly, or implicitly
 >> +for instance by sending a datagram on an unbound UDP socket)
 >> +is allowed
 >> +and it will automatically translate to binding on a kernel-assigned 
ephemeral port.
 >
 > With the caveat of not being a native speaker either, the commas in
 > this sentence feel wrong to me.

I was trying to make the comma match the fact that the example only 
applies to the implicit case, but if it sounds wrong let's use your 
suggestion.

 >> +To allow this if
 >> +.B LANDLOCK_ACCESS_NET_BIND_UDP
 >> +is handled
 >> +(even if
 >> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
 >> +is not),
 >
 > This phrasing is different to the kernel documentation, where it says:
 >
 >     To allow this if both LANDLOCK_ACCESS_NET_BIND_UDP and
 >     LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP are handled, [...]
 >
 >     (see https://docs.kernel.org/userspace-api/landlock.html)
 >
 > Is this intentional?

Absolutely, it's bullet point #1 (the most important imho) in the three 
divergences I listed in the patch description. My current text in the 
kernel docs is not technically wrong, but it does not highlight the most 
non-trivial case (connect+send not handled, but bind handled, causing 
connect+send denials).

 >> +Note on
 >> +.BR AF_UNSPEC :
 >> +Calling
 >> +.BR connect (2)
 >> +on a TCP or UDP socket
 >> +with an address of the
 >> +.B AF_UNSPEC
 >> +family
 >> +can only dissolve existing associations,
 >> +and as such is always allowed.
 >> +On IPv6 UDP sockets, if
 >> +.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
 >> +is handled,
 >> +sending datagrams to
 >> +.B AF_UNSPEC
 >> +addresses is not supported
 >> +and will always result in a denial,
 >> +as if the policy rejected it:
 >> +use a
 >> +.I NULL
 >> +address instead to get the same semantics
 >> +inside and outside a Landlock domain.
 >> +Other uses of the
 >> +.B AF_UNSPEC
 >> +family have unchanged semantics.
 >
 > This second "note" discussion seems to deviate in its meaning from
 > what the second "note" box said in the kernel documentation.
 >
 > https://docs.kernel.org/userspace-api/landlock.html#network-flags
 >
 > Is this intentional?

Yes that's bullet point #2, a better description ("always result in a 
denial, as if the policy rejected it" instead of just "not supported") 
of this deviation from normal network stack behavior.

 > I admittedly have trouble following the documentation in this
 > rewritten note (and also the kernel documentation).  What does
 > "sending datagrams to AF_UNSPEC" mean in the context of IPv6?

You are correct about connect(AF_UNSPEC) semantics, and here I meant 
sendto()/sendmsg()/etc. on an IPv6 UDP socket with a msg_name whose 
family is AF_UNSPEC (which is interpreted as "no address" by the network 
stack). I changed this to a hopefully more explicit wording in v3.

 > Is the new man page phrasing one that you'd also like to carry over
 > into the kernel documentation?

Absolutely, tell me what you think about v3, and once we agree on the 
changes I will send a patch to sync them into the docs.

Have a nice day!

Matthieu
