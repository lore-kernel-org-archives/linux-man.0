From: "Michael Kerrisk" <mtk.manpages@googlemail.com>
Subject: Re: [PATCH] utimensat() non-conformances and fixes [v3]
Date: Tue, 3 Jun 2008 13:52:20 +0200
Message-ID: <cfd18e0f0806030452n32fa6d4dke1e2e4443a361a3@mail.gmail.com>
References: <482D4665.4050401@gmail.com>
	 <E1Jx3Gw-0002eA-55@pomaz-ex.szeredi.hu> <48401E7E.9090304@gmail.com>
	 <cfd18e0f0806030405u1c32b114pa0fdd979f36f87fb@mail.gmail.com>
	 <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <E1K3URo-0005sj-JW@pomaz-ex.szeredi.hu>
Content-Disposition: inline
Sender: linux-fsdevel-owner@vger.kernel.org
To: Miklos Szeredi <miklos@szeredi.hu>
Cc: drepper@redhat.com, viro@zeniv.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org, linux-man@vger.kernel.org, linux-fsdevel@vger.kernel.org
List-Id: linux-man@vger.kernel.org

On Tue, Jun 3, 2008 at 1:13 PM, Miklos Szeredi <miklos@szeredi.hu> wrote:
>> > I'm not sure of the correct way to get the required nameidata (to do a
>> > vfs_permission() call) from the file descriptor.  Can you give me a
>> > tip there?
>>
>> Could you point me at the right way of doing this?
>
> You don't need nameidata for this at all.  Just call permission() with
> a NULL nameidata.

Thanks Miklos!
