import { createContext, useContext } from 'react'

export const HomeContext = createContext({
    showMenu: false,
    setShowMenu: (_value: boolean) => {}
})

export function useHomeContext() {
    return useContext(HomeContext)
}
