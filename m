Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049213;
	b=Knc9kYVh7E3Pz0LHufmG4LHkGKDOOUizv3dHcKRde8cB5qzrdm71OVuKzk5vTPAbqkG2
	 F8fZEy5xIhLhHFyWqOzVLmYTtGJJtHk95u3tF2b91I1mvc5QK/J3DeOOVqgUOQP2SiW1l
	 b5rN4cti7nRGXCOcu9PkDAb6qTOshkIBSbb1l+WkJnjWFiH59MCUIpeFmLHtP1+mKnYri
	 LU+t6SaN6Ux6JH1vNopwi7Llky1IvClHwW0IXtZPEYVL7BMwaP+wDMHw0DJ24pihWCj5z
	 TgZxOepzj1K0Qli4/7ayAdwkMaRUREgObTfqjjzomVUA5KaY2WqOasAH6BeYAj48woQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=6J7woDqK2kCuQc4xRXNXIfA5FxI2jZ3IO6bgnYiPY4s=;
	b=E3PrdOr5AZAV8QY1t45w/9P2T3N/yuOucoq1F1EOt22t9c36yRLQVZ283b63ML+xPTZz
	 OxumOo1AdB6ZcLAnzcYxPyeCPp69a3Wxia2oF8ROlkqHRtzttIX0uUxh0Tw3Sg95F1MIM
	 K7bM8PBhcJxnYNsP//CJxg4Zt7t+LtaCN/3vA79oL5gV97icM/3bqRYh+PYhjfBlvGJl6
	 j9YbtYmfsUcnEXv4nNcDh2cYFb12FtI7WM7LlBXeAFihVe9bAL4t+yrD31fa22Y4MUbV6
	 oba7xvAeQeHViqj/FPL2r3C3ZJWMGU/OJP5IHOPMk8U69iBbfdE/32/k6d/sgy/kcSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRBfkUbd;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A61606A320
	for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 21:13:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1A61606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RRBfkUbd
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df54150dfso1893452f8f.0
        for <linux-man@vger.kernel.org>; Mon, 26 Oct 2026 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793049211; x=1793654011; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6J7woDqK2kCuQc4xRXNXIfA5FxI2jZ3IO6bgnYiPY4s=;
        b=RRBfkUbdExHnMMu337K1Yo+ss+NEYEPJ9s2fIFg+5xgn8eK3xnSQbJ2YZWBQHIqCbL
         UWKzMs9K87YdA5p1/rk12FH0EFCOxLBwKK5tHrS6ZLfQj61fv+leEGOGkFB4AvfkZ99a
         hN642pmtVF/3Fk1Kb3VuWR14q8UBGQ3FQF1GCTEtr4r4QMFsOre+MU1yn4ZTn+emeTpM
         LMOSzfzSMIsTybHuBs1DO5WcHyLqTf6RoQnu9d70OqFMEuxWgArBFRnXs/EMmSBPb96x
         rI/Z8WCV70ay2jfn7vL/9whx6cqF+1HuWtBI5vbBlKM1JHATkyOg4nzA+iHGGeozxDx9
         FnMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049211; x=1793654011;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6J7woDqK2kCuQc4xRXNXIfA5FxI2jZ3IO6bgnYiPY4s=;
        b=XkJx+7gMEL+f0WTcnR1DEMeWSpbIUgdDfkZTVoBOBmJB4VYp0/Q+B5inS3E4c25yc0
         6XbP0DwDB3UU+MDVQRF1gYFtpebF0edN/YS0zqZ6AzcirdvkDWxX63fqa1yQ4pqIqFKk
         57PEnupXBXaxuZ+H58hMD801Npbm6YJzWUSPQqTe2OuUEA5SzCHJdHTyQ+7veeeet0Lz
         nCmmFQINo8zaRQkw2mHuE4xmRmSk7n2Zcxy+pFV1nVxvLvcP2bFHxHtlenj7TXisxjpy
         j9XjfhS6ML2Q2OZH6rNe512P1y69iUADpwKmDi21lqdEG/4WjgZ+JOdpYWQSey1iAzlX
         SbzA==
X-Forwarded-Encrypted: i=1; AKwUvBzSvbhq9m3oIa6V7VUZ4GwJz8gXSoXH6tkS9gx/q5juHQ6IfLag06U7tKyVsGx0l2vt1djO0SLUwkg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeg1lUc8Hc5vtsUqY+b02UuyH6lDkgWGelW6TTQWfqtZuAiShj
	UF8YMrRM/nwM/0MGo4uizHc9eZFg7HE2kTf2uo9IXs+Oj3PuogYDKKh2
X-Gm-Gg: AYBFou38uvoflnrfe3sLQx+fOhOuqekqfauqz3pswVpB8iwWNdfl9cRfw1pDyjj6CyT
	uTKOC2ODDKIhAIzaMUrgVXt0XUuF5RwTm66U5U7domN7jGQOlsh/sMk6IXXUqvTdKzVv36KCRCC
	3amEOE1H0+dg+2u0tpSATmAolylxma5PuTZdSy1vlwYcjn+8UzYH9pUp5Z9XOifHO/rCxEMN+uB
	oQt59XH4VH08JkvcC8RXxTN1ei2O6EUhEJ4+pUo1zLL6/TihaV8omCWMsw2M4/Ow1KRzi5zWlWB
	qbqvpP4LCkVQlQ57JZvDstX9ji7XDkKudEOidbGin2ZrUfket7kBEL5ck2LLi0h2v6kpSuA9zpq
	9U/stvgt0UofY1fJBWL/Ua/708HrBJ+W6tGFv5WUhYRFkuRUxgp6N3kl7JgzyFxBQyXNpo8dJPo
	kMA5P9tLk8/Ru83vDE4qIXNjOOx7EJNOHnz4vmdp7uuLttFjE6BNhKmoN41Ts29mKhzhAO6oA4E
	kJ5RmlIFRef/Srk6i32pkeWKxpEwXQdnC7soauZDbGRbcvEBa153RMFNWtI8dV8Bd6heBDeHvsi
	i243
X-Received: by 2002:a05:6000:41c3:b0:48e:f07:160e with SMTP id ffacd0b85a97d-48e3eb98eeemr13774917f8f.38.1793049210834;
        Mon, 26 Oct 2026 14:13:30 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm18617222f8f.54.2026.10.26.14.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:13:30 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:13:29 +0100
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack3000@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org
Subject: Re: [PATCH 5/8] man/man7/unix.7: SOCK_RAW is accepted as an alias
 for SOCK_DGRAM
Message-ID: <20261026.3728fffc856a@gnoack.org>
References: <20261021210800.27338-2-gnoack3000@gmail.com>
 <20261021210800.27338-7-gnoack3000@gmail.com>
 <atxEv-WBlsqEYo4b@google.com>
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
In-Reply-To: <atxEv-WBlsqEYo4b@google.com>

On Sat, Oct 24, 2026 at 05:44:19AM +0000, Kuniyuki Iwashima wrote:
> On Wed, 21 Oct 2026 23:07:57 +0200, Günther Noack wrote:
> > unix_create() in linux.git net/unix/af_unix.c does:
> > 
> > 	case SOCK_RAW:
> > 		sock->type = SOCK_DGRAM;
> > 		fallthrough;
> > 	case SOCK_DGRAM:
> > 
> > so both socket(AF_UNIX, SOCK_RAW, 0) and the equivalent socketpair()
> > invocation succeed and create datagram sockets.
> > 
> > Cc: Kuniyuki Iwashima <kuniyu@google.com>
> > Assisted-by: LLM
> > Signed-off-by: Günther Noack <gnoack3000@gmail.com>
> > ---
> > 
> > Notes:
> >     For completeness;
> >     
> >     It is more complete to spell it out, but on the other hand, people
> >     should not be passing the SOCK_RAW type when they really mean
> >     SOCK_DGRAM.  I'm on the fence about whether this is useful.  If you
> >     want to omit this one, it also feels reasonable.
> 
> Yes, please drop this patch.
> 
> There is fallback but only for a historical reason; just to
> support too old BSD program IIRC.
> 
> We should not say it's officially supported when it's just
> converted to SOCK_DGRAM.

Sounds good, dropping it.

–Günther
