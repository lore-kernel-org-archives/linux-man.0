From: Scot Doyle <lkml14@scotdoyle.com>
Subject: Re: Edited kexec_load(2) [kexec_file_load()] man page for review
Date: Thu, 29 Jan 2015 01:27:20 +0000 (UTC)
Message-ID: <alpine.DEB.2.11.1501290010120.6022@localhost.localdomain>
References: <20150112221634.GD16162@redhat.com> <54B91271.3000600@gmail.com> <20150127142459.GA12851@redhat.com> <54C89816.8030709@gmail.com> <20150128144803.GC15342@redhat.com> <CAKgNAkhhVq5fuqwH0aPdgR1bKkAPPPuS84hfAFg3grGEJNxS4w@mail.gmail.com>
 <20150128203402.GG15342@redhat.com> <alpine.DEB.2.11.1501282104490.9275@localhost.localdomain> <20150128213125.GH15342@redhat.com> <alpine.DEB.2.11.1501282207570.5656@localhost.localdomain> <20150128222526.GJ15342@redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150128222526.GJ15342@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vivek Goyal <vgoyal@redhat.com>, "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Cc: lkml <linux-kernel@vger.kernel.org>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Kexec Mailing List <kexec@lists.infradead.org>, Andy Lutomirski <luto@amacapital.net>, Dave Young <dyoung@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, "Eric W. Biederman" <ebiederm@xmission.com>, Andi Kleen <andi@firstfloor.org>
List-Id: linux-man@vger.kernel.org

On Wed, 28 Jan 2015, Vivek Goyal wrote:
> On Wed, Jan 28, 2015 at 10:10:59PM +0000, Scot Doyle wrote:
> > On Wed, 28 Jan 2015, Vivek Goyal wrote:
> > > On Wed, Jan 28, 2015 at 09:14:03PM +0000, Scot Doyle wrote:
> > > > When I tested, kexec_file_load required CONFIG_RELOCATABLE. Is the same 
> > > > true for kexec_load? Would it make sense to note this in the man pages 
> > > > along with the need for CONFIG_KEXEC_FILE, etc? Or as an error message?
> > > 
> > > Hmm.., I can't see an explicity dependency between RELOCATABLE and
> > > KEXEC. Both KEXEC and KEXEC_FILE should be able to load a kernel
> > > even if it had RELOCATABLE=n.
> > > 
> > > Just that kernel will run from the address it has been built for.
> > > 
> > > Thanks
> > > Vivek
> > 
> > Confusing, right? kexec_file_load returns -ENOEXEC and dmesg says 
> > "kexec-bzImage64: XLF_CAN_BE_LOADED_ABOVE_4G is not set." which leads to
> > arch/x86/boot/header.S line 396:
> > 
> > #if defined(CONFIG_RELOCATABLE) && defined(CONFIG_X86_64)  
> >    /* kernel/boot_param/ramdisk could be loaded above 4g */
> > # define XLF1 XLF_CAN_BE_LOADED_ABOVE_4G
> > #else
> > # define XLF1 0
> > #endif
> 
> Ah, this one. Actually generic kexec file loading implementation does not
> impose this restriction. It is the image specific loader part which
> decides what kind of bzImage it can load.
> 
> Current implementation (kexec-bzimage64.c), is only supporting loading
> bzImages which are 64bit and can be loaded above 4G. This simplifies
> the implementation of loader.
> 
> But there is nothing which prevents one from implementing other image
> loaders.
> 
> So instead of saying that kexec_file_load() depends on CONFIG_RELOCATABLE,
> it might be better to say in man page that currently this system call
> supports only loading a bzImage which is 64bit and which can be loaded
> above 4G too.
> 
> Thanks
> Vivek

Thanks, I agree, and think it would make sense to list them as part of the
page's ENOEXEC error.
