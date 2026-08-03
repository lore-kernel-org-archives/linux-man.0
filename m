Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C76F42122B
	for <linux-man@vger.kernel.org>; Mon,  3 Aug 2026 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785768302; cv=none; b=UoeiAwJwH8OkGXOSC9MBp5WIwSZBpCYj5tvaT0Upvu8Q+nhQbhQCQHQUSusT6b7nwi7ct7FethCzwi77WFFiH5Qf6uDu4J6+J+NHlumo2Y9E8fj/eIWLGXwz8U2D24FQIYy4+lVEpuzT2oF/LwaJH8Q2T2IsYeh+GjWpQET8efE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785768302; c=relaxed/simple;
	bh=eClRcyE+7u/0QVc2ttthjT7fEKFcSGF8DiH02Hy/ISk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SH2bwVe/WWghI93Q2nJWUGDbPBwYs0YxIVyL3xyGFtV4nhRi/Wz6VUj3yjbRvku43Uq3KaJMOXPym1ls9klcEeYkwBLVBND4bPFuePMOSZEE+ANxLPGhDwCi/qo9RmociqiwQN+yelT9sO9eLXEuZ5sD5QfXhwDLrD3O5iClSns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFHUoOK+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=l6GXDJva; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFHUoOK+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="l6GXDJva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ECGVArWvD5pW2inbyzryOT5at7ZQZrn2cCV3MfcqEG8=;
	b=DFHUoOK+yF1E6lbHC/uYz1+wyjVhs6rgoYj3M9McryYaZLh++dazC/mwU4cQMLMUgdr/E/
	T07UK0Y0mXoylbMmkhCfqkSEOJnKsFsrIIMxbDUjBs+RKZUg3lWropibpUn0DAz2f/7QNE
	37wpV73BbCzcfvakvkrEHMiLzyZ1HqY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-UPM5HzSNMO21eoRJfWkYCA-1; Mon, 03 Aug 2026 10:44:58 -0400
X-MC-Unique: UPM5HzSNMO21eoRJfWkYCA-1
X-Mimecast-MFC-AGG-ID: UPM5HzSNMO21eoRJfWkYCA_1785768297
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6a0de3383c0so1519969a12.2
        for <linux-man@vger.kernel.org>; Mon, 03 Aug 2026 07:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785768297; x=1786373097; darn=vger.kernel.org;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ECGVArWvD5pW2inbyzryOT5at7ZQZrn2cCV3MfcqEG8=;
        b=l6GXDJvaIftM3oEa7HOAIk1tg2/A7BdvC0SLA2AL3xJMwbsuGjjG2No5pPTlxuS1BY
         g+w1YIn/s0nQDvd6itHhdinEwumQPsyq2zpAJVCZTD8UZ/g0GRb2zo0hluDE692B0vRe
         dLhzhiz5fOn4f6R3k9fSpmbT2oxTpZFSHBHGx6vXlMW7UljcBnrav7JSLdZPyf8qLMsp
         Pvgkalp4TZiaSgIiwBzUC0dDYaZI7mI5obDo8Fy8OgcgmrlMEYez92/buKV1KVgHCySX
         Hpfz0xsOB0srx84bBAYBPfrwuubI2Ms/Wm/zEUXjdyWurCJ+nA6kY+AwBbW2q+FFgNOo
         mugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768297; x=1786373097;
        h=content-type:mime-version:references:message-id:in-reply-to:subject
         :cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ECGVArWvD5pW2inbyzryOT5at7ZQZrn2cCV3MfcqEG8=;
        b=C7CfCmznYOkhy6nvifhK49eCE+txgZEHFa2uCdy0uUnqjwMwKO3EpDuJXbbPmW7lVs
         j+7/NrmweyyYgoAMCnVRllephfMB/tmWKkSoDludHrOUYniaNqmL//lQT+0pxH8tm6Gv
         H7QD5kvO1HjuMGIT/foEarQtp8NhRSOB2XelQJdYHZvGlfsg4HTOPkIgKzCb6leWsC2V
         FW85eedNA+/gtaxt19i2a6yY+o7/TyP/10emIpZDLDhpFYK08cRc3c57hyGSfqvE0ZnH
         8FBQWsHcnwylcR1XykgZsJHFAEJjn/GR4uZMpOEq73XFW3bZiy1DlxflT6HlIvzBbpbn
         ozPw==
X-Forwarded-Encrypted: i=1; AHgh+RoLSPWQU+/hoxWnnJ4ldmMGPknggO7b92mnfJCqlxppdrxpF3Hkzm9i6RntZO/iMRMIW5wRqAfCzHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQxHlqJspSgxiGZHFfbgyds6IEJB/1t+AvoK4BKhKdK4TcCdME
	5rOrVuUjFuhL4qZnsHpSnjKCXaDsrkp6ILZfO+IsDu9pA3MYiY7urPhDtDoTKAx8NrQIjBSoUMO
	2TI0osi3YJ7/zxvly+BoEtVtc+YwpjJ0S9GtlMNfcvZIZvkilxkGLNjnqpRPD6Q==
X-Gm-Gg: AR+sD11DuRB+Lq7n/z0RybsNSipumBxJRNnj39lmosNAf6xO0dq3NcYLYBtmsbWN/A0
	HWNgKwKipE+6Qb/rqphuCGAQ+t+gfwXRXJw/5r6S+LXqNaCs/4gLg9/0yZSAAR0N0Uf3Xz/mj3H
	AVtmtuTANFvjNwvah1undxnwNqtieE5XNHl5eUHH0aCvS/jWxxkiMNbZTdQSWkklufSMQYO6swS
	90ptXmHfIxAZp18Exf2REAPqvRy47aFwoRtU8Gn+63Pxg3r/rw49bggiZVQ0FZWye3DvmYg1Oyf
	9sCmvy4DUPxrAJH1mvimei+yGlffDFzs2MGDAuAQcuveH+XVIqBWsd5z5mUq2xrs8jkZKrHY375
	IwWGW0aZBEB3XmICXi971KCGROXz0XYU=
X-Received: by 2002:a05:6402:a5ca:10b0:6a0:edbb:9af1 with SMTP id 4fb4d7f45d1cf-6a0edbb9c8amr3043140a12.3.1785768297239;
        Mon, 03 Aug 2026 07:44:57 -0700 (PDT)
X-Received: by 2002:a05:6402:a5ca:10b0:6a0:edbb:9af1 with SMTP id 4fb4d7f45d1cf-6a0edbb9c8amr3043123a12.3.1785768296893;
        Mon, 03 Aug 2026 07:44:56 -0700 (PDT)
Received: from digraph.polyomino.org.uk (digraph.polyomino.org.uk. [2001:8b0:bf73:93f7::51bb:e332])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c661641sm5672362a12.29.2026.08.03.07.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:44:56 -0700 (PDT)
Received: from jsm28 (helo=localhost)
	by digraph.polyomino.org.uk with local-esmtp (Exim 4.98.2)
	(envelope-from <josmyers@redhat.com>)
	id 1wqtuR-00000000th3-1SqU;
	Mon, 03 Aug 2026 14:44:55 +0000
Date: Mon, 3 Aug 2026 14:44:55 +0000 (UTC)
From: Joseph Myers <josmyers@redhat.com>
To: "G. Branden Robinson" <g.branden.robinson@gmail.com>
cc: Alejandro Colomar <alx@kernel.org>, Sam James <sam@gentoo.org>, 
    linux-man@vger.kernel.org, Keith Bostic <keith@bostic.com>, 
    Mark Harris <mark.hsj@gmail.com>, Nevin Liber <nevin@cplusplusguy.com>, 
    JeanHeyd Meneide <phdofthehouse@gmail.com>, 
    Christopher Bazley <chris.bazley.wg14@gmail.com>, 
    "Serge E. Hallyn" <serge@hallyn.com>, Iker Pedrosa <ipedrosa@redhat.com>, 
    "Evgeny Grin (Karlson2k)" <k2k@drgrin.dev>, 
    Kees Cook <keescook@chromium.org>, bug-gnulib@gnu.org, 
    libc-alpha@sourceware.org, Douglas McIlroy <douglas.mcilroy@dartmouth.edu>
Subject: Re: on glibc forking/reclaiming its man pages (was: on the
 irresponsibility of pursuing C language reform)
In-Reply-To: <20260803143817.kvq3m5wcx6vvspul@illithid>
Message-ID: <9878d16e-82d5-2280-24d0-dbef614254d4@redhat.com>
References: <20260731215122.4p4aepsbgeoibx74@illithid> <87a4r6es6k.fsf@gentoo.org> <am3XeGZyi1Pvr77-@devuan> <87y0epdhxp.fsf@gentoo.org> <am4GT1OkqNZD9FF9@devuan> <87zez5bz49.fsf@gentoo.org> <am4jxBOh_VRvhCQw@devuan> <20260801213421.7e3wvyjwmlwxzd55@illithid>
 <am5oWn8dYoP0r2dw@devuan> <82eff373-3460-3cff-4ed5-0a04b4fe4fad@redhat.com> <20260803143817.kvq3m5wcx6vvspul@illithid>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Aug 2026, G. Branden Robinson wrote:

> On the bright side, I wager that a domain-specific translator to get
> from a specific Texinfo manual--likely one that imposed special rules on
> its maintainers to enable extraction of data necessary for man page
> production--could be written.  The job will demand someone with solid
> domain expertise in both formats.  Better, such people actually exist.

We do in fact have such translation for GCC and binutils; parts of the 
Texinfo manuals are marked up for extraction with a script texi2pod.pl 
with the results then going through pod2man (as shipped with perl).  
(Being intended for converting instructions for invoking a command-line 
program, rather than documentation for library functions, no doubt 
significant changes would be needed to be useful for glibc; also, the 
glibc manual documents lots of things outside of the individual function 
descriptions, and that information wouldn't end up in such generated man 
pages because it's not suitably structured to put in them.)

-- 
Joseph S. Myers
josmyers@redhat.com

